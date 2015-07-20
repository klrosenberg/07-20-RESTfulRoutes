# -----------------------------------------------------------------------------
# Show all users. Functionality to read, update or delete.
# -----------------------------------------------------------------------------
get "/users/new" do
  @user = User.new
  erb :"/users/new"
end

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

get "/users/:id" do
  @user = User.find(params[:id])
  erb :"/users/profile"
end

get "/users" do
  erb :"/users/users"
end

delete "/user/:id" do
  User.delete(params["id"])
end

put "/user/:id" do
  @user = User.find(params["id"])
  if @user.empty?
    erb :"/users"
  else
    erb :"/users/edit"
  end
end

put "user/update" do
end




