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
  

end
