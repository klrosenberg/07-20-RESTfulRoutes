# -----------------------------------------------------------------------------
# Select user to find all stories by that user
# -----------------------------------------------------------------------------
get "/stories/find" do
  erb :"/stories/story_find_by_user_form"
end

get "stories/list_by_user" do
  @user = User.find(params["id"])
  @stories = Stories.where("user_id", params["user.id"])
  erb :"/stories/list"
end


# -----------------------------------------------------------------------------
# Update title of story written by that user
# -----------------------------------------------------------------------------

get "/stories/update" do
end

# -----------------------------------------------------------------------------
# Signed in user Creates a story CANNOT create a story for another user 
# -----------------------------------------------------------------------------

get '/stories/new' do
  erb :"/stories/new_story_form"
end

get "/stories/save" do
  Story.create({"title" => params["title"], "user_id" => params["user_id"]})
  @user = User.find(params["user.id"])
  @stories = Stories.where("user_id", params["user.id"])
  erb :"/stories/list"
end


# -----------------------------------------------------------------------------
# takes you to a list of stories to select which one to delete.. with some route handling help
# -----------------------------------------------------------------------------

get "/stories/select" do
end



# -----------------------------------------------------------------------------
# Form to create new password.
# -----------------------------------------------------------------------------
get "/users/new" do
  @user = User.new
  erb :"/users/new"
end

# -----------------------------------------------------------------------------
# Save new user and encrypt password.
# -----------------------------------------------------------------------------
post "/users/users/create" do
  the_password = BCrypt::Password.create(params["password"])
  
  @user= User.create({name: params["name"], email: params["email"], password: the_password})
  
  if @user.valid?
    # Make a GET request to the following path:
    redirect "/users/#{@user.id}"
  else
    erb :"/users/new"
  end
end

get "/users/edit" do
  @user = User.find(params["id"])
  erb :"/users/edit"
end

# -----------------------------------------------------------------------------
# Show all users. Functionality to read, update or delete.
# -----------------------------------------------------------------------------
get "/users" do
  @users = User.all
  erb :"/users/users"
end

get "/users/select" do
  @users = User.all
  erb :"/users/users_delete_form"
end

get "/users/update" do
  @users = User.all
  erb :"/users/users_update_form"
end

delete "/users/delete" do
  User.delete(params["id"].to_i)
  @users = User.all
  erb :"/users/users"
end

# -----------------------------------------------------------------------------
# Show user profile after signing up.
# -----------------------------------------------------------------------------
get "/users/:id" do
  @user = User.find(params[:id])
  erb :"/users/profile"
end

put "/users/users/update" do
  @user = User.find(params["id"])
  @user.name = params["name"]
  @user.email = params["email"]
  @user.save
  erb :"/users/profile"
end




