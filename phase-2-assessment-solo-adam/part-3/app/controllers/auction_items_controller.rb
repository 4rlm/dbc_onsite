####### collection actions below ############

get '/items/index' do
  @items = Item.all.order("updated_at DESC").paginate(page: params[:page], per_page: 10)

  erb :'items/index'
end

# new
get '/items/new' do
  @item = Item.new  ## Prevents errors on Form Partial.
  erb :'items/new'
end

# create
post '/items' do
  @item = Item.create(params[:item])
  #   if @items.valid?
  #     redirect '/items'
  #   else
  #     status 422
  #     @errors = @items.errors.full_messages
  #     erb :'items/new'
  #   end

  redirect 'items/index'
end

####### member actions below ############

# show
get '/items/:id' do
  @item = Item.find(params[:id])
  erb :'items/show'
end

# edit
get '/items/:id/edit' do
  @item = Item.find(params[:id])
  erb :'items/edit'
end

#### Update Method (patch or put) ####

def update_item
  @item = Item.find(params[:id])
  @item.update(params[:item])
  redirect "/items/#{@item.id}"
end

# update - patch
patch '/items/:id' do
  update_item ## => calls update_item method/code.
end

# update - put
put '/items/:id' do
  update_item ## => calls update_item method/code.
end

# delete
delete '/items/:id' do
  Item.find(params[:id]).destroy!
  redirect '/items/index'
end
