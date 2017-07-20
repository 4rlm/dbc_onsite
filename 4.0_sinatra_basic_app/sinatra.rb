require 'sinatra'
set :views, File.join(File.dirname(__FILE__), "views")


## Root Route
get '/' do
  "Hello world!"
end

## About Route
get '/about' do
  @ice_cream_cones = rand(30) + 1
  erb :about
end

## Greetings Route
get '/greetings/:name' do
  "Hey #{params[:name]}!"
end

## Add Multiple Parameters to Route
get '/cities/:city/greetings/:name' do
  "Hey #{params[:name]}! Welcome to the #{params[:city]} greeting page!"
end


## Add Route to Get Data
get '/greetings' do
  erb :greetings
end

## Add Route to Post Data
post '/custom_greetings' do
  @greeting = params[:greeting]
  erb :greetings
end
