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

# -----------------------------------------------------------------------------
# Show user profile after signing up.
# -----------------------------------------------------------------------------
get "/users/:id" do
  @user = User.find(params[:id])
  erb :"/users/profile"
end

# -----------------------------------------------------------------------------
# Show all users. Functionality to read, update or delete.
# -----------------------------------------------------------------------------
get "/users" do
  @users = User.all
  erb :"/users/users"
end

delete "/users/:id" do
  User.delete(params[:id])
end

put "/users/edit/:id" do
  @user = User.find(params[:id])
  if @user.empty?
    redirect "/users"
  else
    erb :"/users/edit"
  end
end

put "users/update" do
end




