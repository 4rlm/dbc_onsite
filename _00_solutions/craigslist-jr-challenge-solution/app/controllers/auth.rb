get "/login" do
  erb :"auth/login"
end

post "/login" do
  @user = User.find_by(name: params[:user][:name])

  if @user && @user.password == params[:user][:password]
    session[:user] = @user.name
    redirect "/category"
  else
    @errors = "Invalid username or password"
    erb :"auth/login"
  end

end

get "/logout" do
  session.delete(:user)
  redirect "/category"
end