# This controller is for all the CRUD operations related to a Todo.
MyApp.get "/todo" do
  @user = User.find_by_id(session["user_id"]) 

    if @user != nil

        erb :"todos/todo"
    else
        erb :"logins/login"
    end 
end