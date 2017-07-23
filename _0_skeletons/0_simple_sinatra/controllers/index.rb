# get '/' do
#   "Home: Welcome to the app!"
# end

get '/' do
  # @todos = Todo.all
  erb :index
end

# post '/todos' do
#   Todo.create(description: params[:description])
#   redirect '/todos'
# end
