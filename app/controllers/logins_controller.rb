MyApp.get "/" do

  erb :"logins/login"  
end

MyApp.get "/login_user" do
   @user = User.find_by_email(params[:email])
   
   if @user.password == params[:password]

    session["user_id"] = @user.id


  erb :"logins/success_login"
  else
  erb :"logins/fail_login"
end
end

MyApp.get "/logout" do
  session["user_id"] = nil

  erb :"logins/logout"
end
MyApp.get "/edit_login" do
  @user = User.find_by_id(session["user_id"])


  erb :"logins/edit_login"
end
MyApp.get "/finish_update_user/:place" do
  @user = User.find_by_id(params[:place])
  @user.name = params[:edit_name]
  @user.email = params[:edit_email]
  @user.password = params[:edit_password]
  @user.save

  erb :"logins/update_success"
end
MyApp.get "/administrator" do
  @user = User.all

  erb :"users/administer"
end