# This controller is for all the CRUD operations related to a User.
MyApp.get "/new_user" do

  erb :"users/new_user"  
end

MyApp.get "/create_user" do
  new_user = User.new
  new_user.name = params[:new_name]
  new_user.email = params[:new_email]
  new_user.password = params[:new_password]
  new_user.save

  erb :"logins/login_welcome"
end


