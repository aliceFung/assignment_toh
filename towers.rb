class TowerOfHanoi

  attr_accessor :tower_height, :goal_tower, :tower_a, :tower_b, :tower_c, :from, :to


  ##--SET UP GAME--##

  def initialize(height)
    #create tower height
    @tower_a = (1..height).to_a.reverse
    @goal_tower = @tower_a.dup
    @tower_b, @tower_c = [], []
  end

  def introduction
    @instruction = "Enter where you'd like to move the top disk from and to in the format: a,b. Enter 'q' to quit."
    puts "Welcome to Tower of Hanoi!" + "\n#{@instruction}"
  end

  def rules
    puts "1) Only one disk can be moved at a time"
    puts "2) Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack i.e. a disk can only be moved if it is the uppermost disk on a stack."
    puts "3) No disk may be placed on top of a smaller disk."
  end

  def tower_choice(input_letter)
    case input_letter
    when "a"
      return @tower_a
    when "b"
      return @tower_b
    when "c"
      return @tower_c
    end
  end



  ##--USER INPUT CHECKS--##

  def quit
    #end game
    puts "Aww. Ok, goodbye."
    exit
  end

  def game_won?             #test if won
    (@tower_c == @goal_tower || @tower_b == @goal_tower) ? true : false
  end

  def errors(type)
    #put errors
  end

  def valid_input?(input)
    #check if user input is valid & quit option
    towers = ["a", "b", "c"]
    check = false           #whether input is valid
    if input == "q"
      quit
    elsif (towers.include? input[0]) && (towers.include? input[2])
      check = true
    else
      puts "I do not understand. The towers are a, b, and c. #{@instruction}"
    end
    check
  end

  def valid_move?(move)         #check if disk moved is smaller than the one it's stacked on
    #disk_size = move[0].tower_choice[-1]
    #destination_disk_size = move[2].tower_choice[-1]
    #if origin < destination #valid move
    #  return true
    #else
    #  rules
    #  return false
    #end

    true
  end


  ##--GAME PLAY--##

  def move_disk(move)
    tower_choice(move[2]) << tower_choice(move[0]).pop
  end

  def render
    #prints current state of game board
    print @tower_a
    print @tower_b
    print @tower_c
  end

  def play #game loop w/ quit option
    introduction
    rules
    render
    until game_won?
      puts "Your move:"
      move = gets.downcase.chomp
      if valid_input?(move) && valid_move?(move)
        move_disk(move)
        render
      else
        puts @instruction
      end
    end
    puts "Congratulations! You did it!"
  end

end

test = TowerOfHanoi.new(3)
test.play