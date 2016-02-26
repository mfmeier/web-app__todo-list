# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/todo/" do
  @user = User.find_by_id(session["user_id"]) 
  @users = User.all
    @todo_user = Todo.where("user_id" => @user.id)
    @todo_all = Todo.all
    
  

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

MyApp.post "/todo/add_task" do
  @user = User.find_by_id(session["user_id"]) 
  @todo = Todo.where("user_id" => @user.id)
  if @user != nil
    new_task = Todo.new
    new_task.contributor_id = @user.id
    new_task.title = params[:title]
    new_task.description = params[:description]
    new_task.user_id = params[:user_for_task]
    new_task.save
    redirect "/todo/"
  else
  erb :"todos/todo"
  end
end

MyApp.get "/todo/the_list" do
  @todo = Todo.all
  @user = User.all

  erb :"todos/the_list"
end

MyApp.get "/complete_todo/:place" do
  @todo = Todo.find_by_id(params[:place])
  @todo.completed = true
  @todo.save

  erb :"todos/task_follower"
end

MyApp.get "/todo/delete_todo/:place" do 
  @todo = Todo.find_by_id(params[:place])
  @todo.delete
  @todo.save
  if @todo != nil
    redirect "/todo/"
  else
  erb :"todos/add_mine"
  end
end


MyApp.get "/todo/edit_todo/:place" do
  @todo = Todo.find_by_id(params[:place])
  erb :"todos/add_mine"
end
MyApp.get "/todo/edit_todo/finish_update_todo/:place" do
  @todo = Todo.find_by_id(params[:place])
  @todo.title = params[:edit_title]
  @todo.description = params[:edit_description]
  @todo.user_id = params[:edit_user_id]
  @todo.contributor_id = params[:edit_contributor_id]
  @todo.save
  if @todo != nil
    redirect "/todo/"
  else
  erb :"todos/add_mine"
  end
end
































