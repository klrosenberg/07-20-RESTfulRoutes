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

get "/users/delete" do
  @users = User.all
  erb :"/users/users_delete_form"
end

get "/users/update" do
  @users = User.all
  erb :"/users/users_delete_form"
end

# -----------------------------------------------------------------------------
# Show user profile after signing up.
# -----------------------------------------------------------------------------
get "/users/:id" do
  @user = User.find(params[:id])
  erb :"/users/profile"
end

delete "/users/users/delete" do
  User.delete(params["id"])
end

put "/users/users/update" do
  @user = User.find(params["id"])
  @user.name = params["name"]
  @user.email = params["email"]
  @user.save
  erb :"/users/profile"
end




