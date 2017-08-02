get '/horses' do
  @horses = Horse.all
  erb :"/horses/index"
end

get '/horses/new' do
  @horse = Horse.new
  if request.xhr?
    erb :"/horses/new", layout: false
  else
    erb :"/horses/new"
  end
end

post '/horses' do
  @horse = Horse.new(params[:horse])
  if request.xhr?
    if @horse.save
      erb :"/horses/_horse_list", locals: { horse: @horse}, layout: false
    else
      status 422
    end
  elsif @horse.save
    redirect "/horses/#{@horse.id}"
  else
    erb :"/horses/new"
  end
end

get '/horses/:id' do
  @horse = Horse.find(params[:id])
  if request.xhr?
    erb :"/horses/_horse_info", layout: false, locals: { horse: @horse }
  else
    erb :"/horses/show"
  end
end
