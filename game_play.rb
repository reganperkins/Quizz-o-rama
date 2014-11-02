#game play
require_relative 'player'
require_relative 'game_logic'

def math_game_start
  game = Game.new
  # player_turn = 1

  while game.in_play?
    game.generate_question
    game.prompt_player_for_answer
    game.verify_answer
    break if game.in_play? == false
    game.change_player
  end
  game.score_tally
#  puts "Player 1 Score: #{@player1.score} \nPlayer 2 Score: #{@player2.score}"
end

math_game_start