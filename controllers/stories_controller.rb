# -----------------------------------------------------------------------------
# Select user to find all stories by that user
# -----------------------------------------------------------------------------
get "stories/find"do
end


# -----------------------------------------------------------------------------
# Update title of story written by that user
# -----------------------------------------------------------------------------

get "/stories/update" do
end



<li><a href="/stories/new">Create a new story (user must be logged in and story belongs to this user)</li>

<li><a href="/stories/select">Delete users story</li>


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




