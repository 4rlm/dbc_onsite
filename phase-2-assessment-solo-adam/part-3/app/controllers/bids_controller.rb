####### collection actions below ############
get '/bids/index' do
  @bids = Bid.all.order("updated_at DESC").paginate(page: params[:page], per_page: 10)

  erb :'bids/index'
end


# new
get '/bids/new' do
  @bid = Bid.new  ## Prevents errors on Form Partial.
  erb :'bids/new'
end

############################

# create
post '/bids' do
  @bid = Bid.create(params[:bid])
  #   if @bids.valid?
  #     redirect '/bids'
  #   else
  #     status 422
  #     @errors = @bids.errors.full_messages
  #     erb :'bids/new'
  #   end

  redirect 'bids/index'
end

############################


####### member actions below ############

# show
get '/bids/:id' do
  @bid = Bid.find(params[:id])
  erb :'bids/show'
end

# edit
get '/bids/:id/edit' do
  @bid = Bid.find(params[:id])
  erb :'bids/edit'
end

#### Update Method (patch or put) ####

def update_bid
  @bid = Bid.find(params[:id])
  @bid.update(params[:bid])
  redirect "/bids/#{@bid.id}"
end

# update - patch
patch '/bids/:id' do
  update_bid ## => calls update_bid method/code.
end

# update - put
put '/bids/:id' do
  update_bid ## => calls update_bid method/code.
end

# delete
delete '/bids/:id' do
  Bid.find(params[:id]).destroy!
  redirect '/bids/index'
end
