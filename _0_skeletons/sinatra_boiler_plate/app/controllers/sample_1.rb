# sample_1 controller/routes

####### collection actions below ############

# index
get '/sample_1' do
  # @sample_1s = Sample_1.all

  # @wp_sample_1s = Sample_1.all.order("updated_at DESC").paginate(page: params[:page], per_page: 10)

  #### NOTES: will_paginate ####
  # 1/3) Create Instance Variable in Controller
  # 2/3) Iterate Instance Variable in erb: <% @wp_sample_1.each do |sample_1| %>
  # 3/3) Include page menus at bottom of erb: <%= will_paginate @wp_sample_1 %>

  "Sample_1/Index"
  # erb :'sample_1/index'
end

# new
get 'sample_1/new' do
  # @sample_1 = Sample_1.new  ## Prevents errors on Form Partial.
  # erb :'sample_1/new'
end

# create
post 'sample_1' do
  # @sample_1 = Sample_1.create(params[:sample_1])
  #   if @sample_1.valid?
  #     redirect '/sample_1'
  #   else
  #     status 422
  #     @errors = @sample_1.errors.full_messages
  #     erb :'sample_1/new'
  #   end

  redirect '/sample_1'
end

####### member actions below ############

# show
get '/sample_1/:id' do
  # @sample_1 = Sample_1.find(params[:id])
  # erb :'sample_1/show'
end

# edit
get 'sample_1/edit' do
  # @sample_1 = Sample_1.find(params[:id])
  # erb :'sample_1/edit'
end

#### Update Method (patch or put) ####

def update_contact
  # @sample_1 = Sample_1.find(params[:id])
  # @sample_1.update(params[:sample_1])
  # redirect "/Sample_1/#{@sample_1.id}"
end

# update - patch
patch '/sample_1/:id' do
  # update_contact ## => calls update_contact method/code.
end

# update - put
put '/sample_1/:id' do
  # update_contact ## => calls update_contact method/code.
end

# delete
delete '/sample_1/:id' do
  # Sample_1.find(params[:id]).destroy!
  # redirect '/sample_1'
end
