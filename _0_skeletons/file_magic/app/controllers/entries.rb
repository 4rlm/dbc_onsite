####### collection actions below ############

# index
get '/entries' do
  # @entries = Entry.all

  # will_paginate
  # 1/3) Create Instance Variable in Controller
  # 2/3) Iterate Instance Variable in erb: <% @wp_entries.each do |contact| %>
  # 3/3) Include page menus at bottom of erb: <%= will_paginate @wp_entries %>

  @entries = Entry.all.order("updated_at DESC").paginate(page: params[:page], per_page: 10)

  erb :'entries/index'
end


# new
get '/entries/new' do
  @entry = Entry.new  ## Prevents errors on Form Partial.
  erb :'entries/new'
end

# create
post '/entries' do
  # tags = params[:name]
  # tags = tags.delete(',')
  # tags = tags.split(' ')

  @entry = Entry.create(params[:entry])

  @entry.tags = Tag.parse_tags(params[:tag][:name]) # where tag is created.

    # if @entry.valid?
    #   redirect '/entries'
    # else
    #   status 422
    #   @errors = @entry.errors.full_messages
    #   erb :'entries/new'
    # end
  redirect '/entries'
end


# ####### member actions below ############

# show
get '/entries/:id' do
  @entry = Entry.find(params[:id])
  # @entry_concat_tags = @entry.tags.map(&:name).join(', ')
  erb :'entries/show'
end

# edit
get '/entries/:id/edit' do
  @entry = Entry.find(params[:id])
  # @entry_concat_tags = @entry.tags.map(&:name).join(', ')
  erb :'entries/edit'
end

# #### Update Method (patch or put) ####

def update_entry
  # puts params
  @entry = Entry.find(params[:id])
  @entry.update(params[:entry])
  @entry.tags = Tag.parse_tags(params[:tag][:name]) # where tag is created.
  redirect "/entries/#{@entry.id}"
end

# update - patch
patch '/entries/:id' do
  update_entry
  # puts params
end

# update - put
put '/entries/:id' do
  update_entry
end

# delete
delete '/entries/:id' do
  Entry.find(params[:id]).destroy!
  redirect '/entries'
end
