class FollowingsController < ApplicationController
  def index
    @followings = Following.all

    render("following_templates/index.html.erb")
  end

  def show
    @following = Following.find(params.fetch("id_to_display"))

    render("following_templates/show.html.erb")
  end

  def new_form
    @following = Following.new

    render("following_templates/new_form.html.erb")
  end

  def create_row
    @following = Following.new

    @following.recipient_id = params.fetch("recipient_id")
    @following.sender_id = params.fetch("sender_id")

    if @following.valid?
      @following.save

      redirect_back(:fallback_location => "/followings", :notice => "Following created successfully.")
    else
      render("following_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @following = Following.find(params.fetch("prefill_with_id"))

    render("following_templates/edit_form.html.erb")
  end

  def update_row
    @following = Following.find(params.fetch("id_to_modify"))

    @following.recipient_id = params.fetch("recipient_id")
    @following.sender_id = params.fetch("sender_id")

    if @following.valid?
      @following.save

      redirect_to("/followings/#{@following.id}", :notice => "Following updated successfully.")
    else
      render("following_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @following = Following.find(params.fetch("id_to_remove"))

    @following.destroy

    redirect_to("/followings", :notice => "Following deleted successfully.")
  end
end
