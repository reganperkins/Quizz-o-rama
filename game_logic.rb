# game logic

class Game
  def initialize
    @player1 = Player.new
    @player2 = Player.new
    @player_turn = 1
    @operators = [:+, :-, :*]
  end

  def change_player
    if @player_turn  == 1
      @player_turn = 2
    else
      @player_turn = 1
    end 
  end

  def current_player
    if @player_turn == 1
      "Player 1"
    else
      "Player 2"
    end
  end

  def generate_question
    @first_number = rand(1..20)
    @second_number = rand(1..20)
    @op = @operators.sample
  end

  def prompt_player_for_answer
    puts "#{current_player} what is #{@first_number} #{@op} #{@second_number}"
    @user_answer = gets.chomp.to_i
  end

  def verify_answer
 #   if @user_answer == @first_number + @second_number
    if @user_answer == @first_number.send(@op, @second_number) 
      puts 'Nice work!' 
      score_point
    else
      puts ' Wrong answer'
      subtract_lives
      subtract_point
    end
  end

  def subtract_lives
    if @player_turn == 1
      @player1.lives -= 1
    else
      @player2.lives -= 1
    end
  end

  def score_point
    if @player_turn == 1
      @player1.score += 1
    else
      @player2.score += 1
    end
  end

  def subtract_point
    if @player_turn == 1
      @player1.score -= 1 if @player1.score > 0
    else
      @player2.score -= 1 ifs @player1.score > 0
    end
  end


  def score_tally
    puts "Player 1 Score: #{@player1.score} \nPlayer 2 Score: #{@player2.score}"
  end

  def in_play?
    (@player1.lives > 0) && (@player2.lives > 0)
  end

end


