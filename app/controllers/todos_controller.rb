# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/todo" do
  @user = User.find_by_id(session["user_id"]) 

    if @user != nil

        erb :"todos/todo"
    else
        erb :"logins/login"
    end 
end
MyApp.get "/finish_update_user/todo" do
  @user = User.find_by_id(session["user_id"]) 
  @todo = Todo.where(user_id => @user.id)
    if @user != nil

        erb :"todos/todo"
    else
        erb :"logins/login"
    end 
end

MyApp.get "/add_task" do
    @user = User.find_by_id(session["user_id"]) 
    @todo = Todo.where(user_id => @user.id)
  new_task = Todo.new
  new_task.user_id = @user.id
  new_task.title = params[:title]
  new_task.description = params[:description]
  new_task.save

  erb :"todos/task_follower"
end

MyApp.get "/the_list" do
  @todo = Todo.all

  erb :"todos/the_list"
end
