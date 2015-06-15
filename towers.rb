class TowerOfHanoi

  attr_accessor :tower_height, :goal_tower, :tower_a, :tower_b, :tower_c

  def initialize(height)
    #create tower height
    @tower_a = (1..height).to_a.reverse
    @goal_tower = @tower_a.dup
    @tower_b, @tower_c = [], []
  end

  def introduction
    @instruction = "Enter where you'd like to move the top disk from and to in the format: a,b. Enter 'q' to quit."
    puts "Welcome to Tower of Hanoi!" + "/n @instruction"
  end

  def rules
    puts "1) Only one disk can be moved at a time"
    puts "2) Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack i.e. a disk can only be moved if it is the uppermost disk on a stack."
    puts "3) No disk may be placed on top of a smaller disk."
  end

  def quit
    #end game
    if game_won?
      render
      puts "Congratulations! You did it!"
    else
      puts "Aww. Ok, goodbye."
    end
    exit
  end

  def game_won?
    #test if won
    (@tower_c == @goal_tower || @tower_b == @goal_tower) ? true : false
  end

  def errors(type)
    #put errors
  end

  def valid_input?(input)
    #check if user input is valid & quit option
    towers = ["a", "b", "c"]
    pass = false
    if input == "q"
      quit
    elsif towers.include? input[0] && towers.include? input[2]
      pass = true
    else
      puts "I do not understand. #{@instruction}"
    end
    pass
  end

  def valid_move?(directions)
    #check if disk moved is smaller than the one it's stacked on
    if #valid move
      return true
    else
      rules
      return false
    end
  end

  def move_disk(move)

    #game move

  end

  def render
    #prints current state of game board

  end

  def play #game loop w/ quit option
    introduction
    rules
    render
    until game_won?
      puts "Your move:"
      move = gets.chomp
      if valid_input?(move) && valid_move?(move)
        move_disk(move)
        render
      else
        puts @instruction
      end
    end
  end

end

test = TowerOfHanoi.new(3)
test.play