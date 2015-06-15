class TowerOfHanoi

  attr_accessor :tower_height, :goal_tower, :tower_a, :tower_b, :tower_c

  def initialize
    #create tower height
    @tower_a = (1..@tower_height).to_a.reverse
    @goal_tower = @tower_a.dup
    @tower_b, @tower_c = [], []
  end

  def instructions
  puts "Welcome to Tower of Hanoi!"
  puts "Instructions: Enter where you'd like to move from and to in the format [a,b]. Enter 'q' to quit."
  end

  def rules
    puts "1) Only one disk can be moved at a time"
    puts "2) Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack i.e. a disk can only be moved if it is the uppermost disk on a stack."
    puts "3) No disk may be placed on top of a smaller disk."
  end

  def quit
    #end game
    puts "Aww. Ok, goodbye."
    exit
  end

  def game_won?
    #test if won
    if @tower_c == @goal_tower || @tower_b == @goal_tower
      puts "Congratulations! You did it!"
      exit
    else
      false
    end
  end

  def valid_input?
    #check if user input is valid & quit option
  end

  def valid_move?
    #check if disk moved is smaller than the one it's stacked on
  end

  def move_disk
    #game move
  end

  def render
    #prints current state of game board
  end

  def play #game loop w/ quit option
    #instructions
    #board
    #move_disk
    #play
    #check quit, input, move, then move, then status
  end

end