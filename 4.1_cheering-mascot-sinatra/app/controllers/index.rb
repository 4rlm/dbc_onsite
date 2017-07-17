get '/' do
  @sign_text = params[:sign_text]
  # Look in app/views/index.erb
  erb :index
end

post '/cheers' do
  @sign_text = Mascot.sign_for(params[:cheer_name])
  erb :index
end
