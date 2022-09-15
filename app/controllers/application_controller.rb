class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  #players routing
  get '/players' do
    players = Player.all
    players.to_json
  end

  post '/players' do
    player = Player.create(name: params[:name])
    player.to_json
  end

  patch '/players/:id' do
    player = Player.find(id: params[:id])
    player.update(name: params[:name])
    player.to_json
  end


  #guesses routing

  get '/guesses' do
    guesses = Guess.all
    guesses.to_json
  end

  post '/guesses' do
    guess = Guess.create(
      actor: params[:actor],
      player_id: params[:player_id]
    )
    guess.to_json
  end

  patch '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.update(actor: params[:actor])
    guess.to_json
  end


end
