# -----------------------------------------------------------------------------
# List all users +++
# -----------------------------------------------------------------------------
get "/stories" do
  @user = User.find(params["id"])
  @stories = Story.where("user_id = @user.id")
  erb :"/stories/index"
end

get "/stories/users" do
  @users = User.all
  erb :"/stories/users"
end