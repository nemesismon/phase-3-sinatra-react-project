class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #players routing
  get '/players' do
    Player.all.to_json(include: :guesses)
  end

  post '/players' do
    player = Player.create(name: params[:name])
    player.to_json(include: :guesses)
  end

  #guesses routing
  post '/guesses' do
    player = Player.find(params[:player_id])
    guess = player.guesses.create(
      actor: params[:actor],
    )
    guess.to_json
  end

  patch '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.update(actor: params[:actor])
    guess.to_json
  end

  delete '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.destroy
  end

end
