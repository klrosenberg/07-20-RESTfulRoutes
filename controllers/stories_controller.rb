# -----------------------------------------------------------------------------
# Select user to find all stories by that user
# -----------------------------------------------------------------------------
get "/stories/find" do
  erb :"/stories/story_find_by_user_form"
end

get "/stories/stories/list_by_user" do
  user_id = params["id"]
  @user = User.find(user_id)
  @stories = Story.where("user_id = #{user_id}")
  erb :"/stories/list"
end


# -----------------------------------------------------------------------------
# Update title of story written by that user
# -----------------------------------------------------------------------------

get "/stories/update" do

  @story = Story.find(params["id"])
  binding.pry
  erb :"/stories/update_story_form"
end

put "/stories/update_save" do

  @story = Story.find(params["id"])
  @story.title = params["title"]
  @story.save
  
  @allstories = Story.all
  erb :"/stories/all_list"
end


# -----------------------------------------------------------------------------
# Signed in user Creates a story CANNOT create a story for another user 
# -----------------------------------------------------------------------------

get '/stories/new' do
  erb :"/stories/new_story_form"
end

post "/stories/update_save" do
  binding.pry
  user_id = params["user_id"]
  Story.create({"title" => params["title"], "user_id" => user_id})
  @user = User.find(params["user_id"])
  ("user_id = 1")
  @stories = Story.where("user_id = #{user_id}")
  erb :"/stories/list"
end


# -----------------------------------------------------------------------------
# takes you to a list of stories to select which one to delete.. with some route handling help
# -----------------------------------------------------------------------------

get "/stories/select" do
  erb :"/stories/complete_list"
end

# -----------------------------------------------------------------------------
# deleting a story
# -----------------------------------------------------------------------------

get "/stories/delete" do
  Story.delete(params["id"])
  erb :"/stories/complete_list"
end







