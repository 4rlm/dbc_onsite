get '/' do
  @entries = Entry.order('updated_at ASC').limit(10)
  ## query: joins, group, order, count, limit, count ##
  @tags = Tag.joins(:taggings).group("tags.name, tags.id").order("count(tags.name) desc").limit(10)

  erb :index
end

############ Trial as Module ########
get '/file_magic' do
  erb :'file_magic'
end


######## Tags ############

## Working Well.
post '/upload' do
  model = params[:model].capitalize.constantize
  tempfile = params[:file][:tempfile]
  data_file = MagicFiler.new(model)
  data_file.upload_csv(tempfile, model)
  redirect '/file_magic'
end


## .backup_csv
get '/backup_csv/:model' do
  model = params[:model].capitalize.constantize
  data_file = MagicFiler.new(model)
  data_file.backup_csv
  redirect '/file_magic'
end


## .download_csv
get '/download_csv/:model' do
  model = params[:model].capitalize.constantize
  data_file = MagicFiler.new(model)
  data_file.download_csv
  send_file(data_file.file_path, filename: data_file.file_name)
  redirect '/file_magic'
end

## .download_xls
# format.xls { send_data @products.to_csv(col_sep: "\t") }
####################


# ===== From CSV / Upload Methods Start Here =====

## Working Well.
post '/upload' do
  model = params[:model].capitalize.constantize
  tempfile = params[:file][:tempfile]
  data_file = MagicFiler.new(model)
  data_file.upload_csv(tempfile, model)
  redirect '/file_magic'
end

## Working Well.
get '/upload_csv/:model' do
  erb :'/file_upload_form', locals: { model: params[:model]}
end








################ IMPORTANT!!! ################
#### Upload and download files in Sinatra ####

=begin

# List
get '/' do
  list = Dir.glob("./files/*.*").map{|f| f.split('/').last}
  # render list here
end

# Upload
post '/' do
  tempfile = params['file'][:tempfile]
  filename = params['file'][:filename]
  File.copy(tempfile.path, "./files/#{filename}")
  redirect '/'
end

# Download
get '/download/:filename' do |filename|
  send_file "./files/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end

# Delete
get '/remove/:filename' do |filename|
  File.delete("./files/#{filename}")
  redirect '/'
end

=end
