class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/" do
    { message: "The Name Game!" }.to_json
  end

  #players routing
  get '/players' do
    Player.all.to_json
  end

  post '/players' do
    Player.create(name: params[:name])
    Player.all.to_json
  end

  patch '/players/:id' do
    player = Player.find(id: params[:id])
    player.update(name: params[:name])
    Player.all.to_json
  end


  #guesses routing

  get '/guesses' do
    Guess.all.to_json
  end

  post '/guesses' do
    Guess.create(
      actor: params[:actor],
    )
    Guess.all.to_json
  end

  patch '/guesses/:id' do
    guess = Guess.find_by(params[:id])
    guess.update(actor: params[:actor])
    Guess.all.to_json
  end

  delete '/guesses/:id' do
    guess = Guess.find(params[:id])
    guess.destroy
    Guess.all.to_json
  end

end
