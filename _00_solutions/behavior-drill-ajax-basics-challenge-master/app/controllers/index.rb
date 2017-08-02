get '/' do
  redirect '/release_0'
end

# Release 0
get '/release_0' do
  erb :"basics/release_0"
end

# Release 1
get '/release_1' do
  erb :"basics/release_1"
end

get '/using_json' do
  {message: "I'm the body of the response from a GET request using json."}.to_json
end

post '/using_json' do
  {message: "I'm the body of the response from a POST request using json. #{params[:name]} is #{params[:age]} years old and #{params[:description]}."}.to_json
end



