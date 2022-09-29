class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    { message: "The Name Game!" }.to_json
  end

  #players routing
  get '/players' do
    Player.all.to_json(include: :guesses)
  end

  post '/players' do
    Player.create(name: params[:name])
    Player.all.to_json(include: :guesses)
  end

  patch '/players/:id' do
    player = Player.find(id: params[:id])
    player.update(name: params[:name])
    Player.all.to_json(include: :guesses)
  end


  #guesses routing

  get '/guesses' do
    Player.all.to_json(include: :guesses)
  end

  post '/guesses' do
    Guess.create(
      actor: params[:actor],
      player_id: params[:player_id]
    )
    Player.all.to_json(include: :guesses)
  end

  patch '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.update(actor: params[:actor])
    Player.all.to_json(include: :guesses)
  end

  delete '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.destroy
    Player.all.to_json(include: :guesses)
  end

end
