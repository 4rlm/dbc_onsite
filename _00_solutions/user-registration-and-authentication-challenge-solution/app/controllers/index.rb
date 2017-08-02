get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/register' do
  User.create(params[:user])
  redirect '/login'
end

get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session['user_id'] = user.id
    redirect '/'
  else
    @errors = "Invalid Password or Username"
    erb :login
  end
end