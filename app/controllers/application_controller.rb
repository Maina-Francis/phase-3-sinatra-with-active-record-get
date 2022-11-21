class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get '/games' do
    #get all games from the database
    games = Game.all.order(:title).limit(10)

    #return json response with an array of games
    games.to_json
  end

  get '/games/:id' do
    #look up games in the database using the id parameter
    game =Game.find(params[:id])

    #send json-formatted response of the game data  
    game.to_json(include: {reviews: {include: :user}})
  end

end
