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
#Tag .to_csv
get '/tag_to_csv' do
  data_file = MagicFiler.new(Tag)
  data_file.to_csv
  redirect '/file_magic'
end

#Tag .to_csv.and_download
get '/tag_to_csv_and_download' do
  data_file = MagicFiler.new(Tag)
  data_file.and_download
  send_file(data_file.file_path, filename: data_file.file_name)
  redirect '/file_magic'
end
####################

######## Entries ############
#Entry .to_csv
get '/entry_to_csv' do
  data_file = MagicFiler.new(Entry)
  data_file.to_csv
  redirect '/file_magic'
end

#Entry .to_csv.and_download
get '/entry_to_csv_and_download' do
  data_file = MagicFiler.new(Entry)
  data_file.and_download
  send_file(data_file.file_path, filename: data_file.file_name)
  redirect '/file_magic'
end
####################









# ############ Working as Class ########
# get '/file_magic' do
#
#   # sporty = ImportExport.new(Tag).to_csv_dir
#   csv_dl = ImportExport.new(Tag).download_file
#   send_file(csv_dl.file_path, filename: csv_dl.file_name)
#
#   redirect '/'
# end
# ####################









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
