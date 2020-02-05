class PostsController < ApplicationController
  before_action :current_user_must_be_post_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_post_user
    post = Post.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == post.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(:distinct => true).includes(:likes, :user, :fans).page(params[:page]).per(10)

    render("post_templates/index.html.erb")
  end

  def show
    @like = Like.new
    @post = Post.find(params.fetch("id_to_display"))

    render("post_templates/show.html.erb")
  end

  def new_form
    @post = Post.new

    render("post_templates/new_form.html.erb")
  end

  def create_row
    @post = Post.new

    @post.image = params.fetch("image") if params.key?("image")
    @post.caption = params.fetch("caption")
    @post.user_id = params.fetch("user_id")

    if @post.valid?
      @post.save

      redirect_back(:fallback_location => "/posts", :notice => "Post created successfully.")
    else
      render("post_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @post = Post.find(params.fetch("prefill_with_id"))

    render("post_templates/edit_form.html.erb")
  end

  def update_row
    @post = Post.find(params.fetch("id_to_modify"))

    @post.image = params.fetch("image") if params.key?("image")
    @post.caption = params.fetch("caption")
    

    if @post.valid?
      @post.save

      redirect_to("/posts/#{@post.id}", :notice => "Post updated successfully.")
    else
      render("post_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @post = Post.find(params.fetch("id_to_remove"))

    @post.destroy

    redirect_to("/users/#{@post.user_id}", notice: "Post deleted successfully.")
  end

  def destroy_row
    @post = Post.find(params.fetch("id_to_remove"))

    @post.destroy

    redirect_to("/posts", :notice => "Post deleted successfully.")
  end
end
