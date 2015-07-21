# -----------------------------------------------------------------------------
# List all users +++
# -----------------------------------------------------------------------------
get "/users" do
  @users = User.all
  erb :"/users/index"
end

# -----------------------------------------------------------------------------
# Form to create new user +++
# -----------------------------------------------------------------------------
get "/users/new" do
  @user = User.new
  erb :"/users/new"
end

# -----------------------------------------------------------------------------
# Create new user +++
# -----------------------------------------------------------------------------
post "/users" do
  the_password = BCrypt::Password.create(params["password"])
  @user= User.create({name: params["name"], email: params["email"], password: the_password})
  if @user.valid?
    # Make a GET request to the following path:
    redirect "/users/#{@user.id}"
  else
    erb :"/users/new"
  end
end

# -----------------------------------------------------------------------------
# Get list of users to possibly delete
# -----------------------------------------------------------------------------
get "/users/delete" do
  @users = User.all
  erb :"/users/delete_form"
end

delete "/users/confirm_delete" do
  @user_id = params["id"]
  User.delete(@user_id)
  @users = User.all
  erb :"users/index"
end

# -----------------------------------------------------------------------------
# Form to delete user
# -----------------------------------------------------------------------------
# delete "/users/:id" do
#   binding.pry
#   User.delete(params[:id])
#   erb :"/users/index"
# end

# -----------------------------------------------------------------------------
# Form to edit user +++
# -----------------------------------------------------------------------------
get "/users/:id/edit" do
  @user = User.find(params["id"])
  erb :"/users/edit_form"
end

# -----------------------------------------------------------------------------
# Update user with new information +++
# -----------------------------------------------------------------------------
put "/users/:id" do
  @user = User.find(params["id"])
  @user.name = params["name"]
  @user.email = params["email"]
  @user.save
  erb :"/users/profile"
end

# -----------------------------------------------------------------------------
# Show user +++
# -----------------------------------------------------------------------------
get "/users/:id" do
  @user = User.find(params[:id])
  erb :"/users/profile"
end