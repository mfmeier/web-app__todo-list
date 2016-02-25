# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/todo/" do
  @user = User.find_by_id(session["user_id"]) 
  @users = User.all
    @todo_user = Todo.where("user_id" => @user.id)
    @todo_all = Todo.all
    @g = 
 

    if @user != nil

        erb :"todos/todo"
    else
        erb :"logins/login"
    end 
end
MyApp.get "/finish_update_user/todo" do
  @user = User.find_by_id(session["user_id"]) 
    if @user != nil

        erb :"todos/todo"
    else
        erb :"logins/login"
    end 
end

MyApp.get "/todo/add_task" do
    @user = User.find_by_id(session["user_id"]) 
    @todo = Todo.where("user_id" => @user.id)
  new_task = Todo.new
  new_task.contributor_id = @user.id
  new_task.title = params[:title]
  new_task.description = params[:description]
  new_task.user_id = params[:user_for_task]
  new_task.save

  erb :"todos/todo"
end

MyApp.get "/the_list" do
  @todo = Todo.all

  erb :"todos/the_list"
end

MyApp.get "/complete_todo/:place" do
  @todo = Todo.find_by_id(params[:place])
  @todo.completed = true
  @todo.save

  erb :"todos/task_follower"
end