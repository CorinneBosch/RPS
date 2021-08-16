require_relative 'lib/player'
require_relative 'lib/rps'
require_relative 'lib/robot'
require 'sinatra/base'
require 'sinatra/reloader'

class Game < Sinatra::Base

  configure:development do 
    register Sinatra::Reloader
  end

  enable :sessions

  get '/' do
    erb :index
  end

  post '/welcome' do
    session[:name] = Player.new(params[:name])
    redirect '/game'
  end

  get '/game' do
    @name = session[:name].name
    erb :game
  end

  post '/move' do
    session[:player_move] = params[:move]
    redirect '/result'
  end

  get '/result' do
    @robot = Robot.new.random_move
    @move = session[:player_move]
    @game = Rps.new(session[:player_move], @robot)
    @game.result
    # @game.result

    erb :result
    # @game.result
  end

  # get '/defeat' do
  # end
  run! if app_file == $0
end