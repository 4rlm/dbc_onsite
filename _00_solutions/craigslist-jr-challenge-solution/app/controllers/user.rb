get "/user/new" do
  erb :"user/new"
end

post "/user/new" do
  @user = User.new(params[:user])
  if @user.save
    session[:user] = @user.name
    redirect "/category"
  else
    redirect "/user/new"
  end
end
