require_relative 'player'
require_relative 'robot'

class Rps
  attr_reader :player_move, :robot_move, :game

  SCORE = 1

  def initialize(player_move, robot_move)
    @player_move = player_move
    @robot_move = robot_move
    @game = game
  end

  def self.create(player_move, robot_move, score)
    @game = Rps.new(player_move, robot_move, score = SCORE)
  end

  def self.instance
    @game
  end

  def result
    score = { 'scissors' => 'paper', 'paper' => 'rock', 'rock' => 'scissors' }

    return 'Draw!' if @player_move == @robot_move
    return 'Victory!' if score[@player_move] == @robot_move
    return 'Defeat!' if score[@robot_move] == @player_move

    # (@score = score + 0) if (@player_move == @robot_move)
    # (@score = score + 1) if (signs[@player_move] == @robot_move)
    # (@score = score - 1) if (signs[@robot_move] == @player_move)
    # puts 'hello'
  end
end

# rps = Rps.new('rock', 'scissors', 1)
# rps.result
# p rps