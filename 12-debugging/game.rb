require_relative 'player'
require 'pry'
class Game
  attr_reader :width, :height
  attr_accessor :players

  def initialize(number_of_players)
    @width = 10
    @height = 10
    @players = []
    number_of_players.times do
      x = rand(0..@width)
      y = rand(0..@height)
      @players << Player.new(x, y)
    end
  end

  def self.start
    puts "It's Adventure Time!"
    print "How many people are adventuring? "
    number_of_players = gets.chomp.to_i

    game = Game.new(number_of_players)
    game.turn
  end

  def turn
    moves = [1, -1]

    @players.each do |player|
      puts "Player #{player.id} moved!"
      new_x = moves.sample
      new_y = moves.sample

      if new_x >= 0 && new_x < width
        player.x += new_x
      end

      if new_y >= 0 && new_y < height
        player.y += new_y
      end
    end
  end

end

Game.start
