Rails.application.routes.draw do
  # Routes for the Following resource:

  # CREATE
  get("/followings/new", { :controller => "followings", :action => "new_form" })
  post("/create_following", { :controller => "followings", :action => "create_row" })

  # READ
  get("/followings", { :controller => "followings", :action => "index" })
  get("/followings/:id_to_display", { :controller => "followings", :action => "show" })

  # UPDATE
  get("/followings/:prefill_with_id/edit", { :controller => "followings", :action => "edit_form" })
  post("/update_following/:id_to_modify", { :controller => "followings", :action => "update_row" })

  # DELETE
  get("/delete_following/:id_to_remove", { :controller => "followings", :action => "destroy_row" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  get("/likes/new", { :controller => "likes", :action => "new_form" })
  post("/create_like", { :controller => "likes", :action => "create_row" })

  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  get("/likes/:id_to_display", { :controller => "likes", :action => "show" })

  # UPDATE
  get("/likes/:prefill_with_id/edit", { :controller => "likes", :action => "edit_form" })
  post("/update_like/:id_to_modify", { :controller => "likes", :action => "update_row" })

  # DELETE
  get("/delete_like/:id_to_remove", { :controller => "likes", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  get("/posts/new", { :controller => "posts", :action => "new_form" })
  post("/create_post", { :controller => "posts", :action => "create_row" })

  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  get("/posts/:id_to_display", { :controller => "posts", :action => "show" })

  # UPDATE
  get("/posts/:prefill_with_id/edit", { :controller => "posts", :action => "edit_form" })
  post("/update_post/:id_to_modify", { :controller => "posts", :action => "update_row" })

  # DELETE
  get("/delete_post/:id_to_remove", { :controller => "posts", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
