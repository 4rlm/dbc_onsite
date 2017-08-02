####### collection actions below ############
get '/users/index' do
  @users = User.all.order("updated_at DESC").paginate(page: params[:page], per_page: 10)

  erb :'users/index'
end


# new
get '/users/new' do
  @user = User.new  ## Prevents errors on Form Partial.
  erb :'users/new'
end

# create
post '/users' do
  @user = User.create(params[:user])
  #   if @users.valid?
  #     redirect '/users'
  #   else
  #     status 422
  #     @errors = @users.errors.full_messages
  #     erb :'users/new'
  #   end

  redirect 'users/index'
end

############################


####### member actions below ############

# show
get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/show'
end

# edit
get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/edit'
end

#### Update Method (patch or put) ####

def update_user
  @user = User.find(params[:id])
  @user.update(params[:user])
  redirect "/users/#{@user.id}"
end

# update - patch
patch '/users/:id' do
  update_user ## => calls update_user method/code.
end

# update - put
put '/users/:id' do
  update_user ## => calls update_user method/code.
end

# delete
delete '/users/:id' do
  User.find(params[:id]).destroy!
  redirect '/users/index'
end
