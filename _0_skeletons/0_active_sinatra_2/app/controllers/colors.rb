get '/colors' do
  @colors = Color.all

  erb :color
end

post '/colors' do
  Color.create(name: params[:name], shape: params[:shape])

  redirect '/colors'
end

put '/colors' do
  Color.update_attribute(id: params[:id], name: params[:name], shape: params[:shape])

  redirect '/colors'
end
