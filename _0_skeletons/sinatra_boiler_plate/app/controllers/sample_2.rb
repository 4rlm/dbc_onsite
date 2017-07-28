# sample_2 controller/routes

####### collection actions below ############

# index
get '/sample_2' do
  # @sample_2s = sample_2.all

  # @wp_sample_2s = sample_2.all.order("updated_at DESC").paginate(page: params[:page], per_page: 10)

  #### NOTES: will_paginate ####
  # 1/3) Create Instance Variable in Controller
  # 2/3) Iterate Instance Variable in erb: <% @wp_sample_2.each do |sample_2| %>
  # 3/3) Include page menus at bottom of erb: <%= will_paginate @wp_sample_2 %>

  "Sample_2/Index"
  # erb :'sample_2/index'
end

# new
get 'sample_2/new' do
  # @sample_2 = sample_2.new  ## Prevents errors on Form Partial.
  # erb :'sample_2/new'
end

# create
post 'sample_2' do
  # @sample_2 = sample_2.create(params[:sample_2])
  #   if @sample_2.valid?
  #     redirect '/sample_2'
  #   else
  #     status 422
  #     @errors = @sample_2.errors.full_messages
  #     erb :'sample_2/new'
  #   end

  # redirect '/sample_2'
end

####### member actions below ############

# show
get '/sample_2/:id' do
  # @sample_2 = sample_2.find(params[:id])
  # erb :'sample_2/show'
end

# edit
get 'sample_2/edit' do
  # @sample_2 = sample_2.find(params[:id])
  # erb :'sample_2/edit'
end

#### Update Method (patch or put) ####

def update_contact
  # @sample_2 = sample_2.find(params[:id])
  # @sample_2.update(params[:sample_2])
  # redirect "/sample_2/#{@sample_2.id}"
end

# update - patch
patch '/sample_2/:id' do
  # update_contact ## => calls update_contact method/code.
end

# update - put
put '/sample_2/:id' do
  # update_contact ## => calls update_contact method/code.
end

# delete
delete '/sample_2/:id' do
  # sample_2.find(params[:id]).destroy!
  redirect '/sample_2'
end
