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
    @instruction = "Enter where you'd like to move the top disk from and to in the format: a,b. \nEnter 'q' to quit."
    puts "Welcome to Tower of Hanoi!" + "\n#{@instruction}"
  end

  def rules
    puts "1) Only one disk can be moved at a time"
    puts "2) Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack i.e. a disk can only be moved if it is the uppermost disk on a stack."
    @rule_3 = "No disk may be placed on top of a smaller disk."
    puts "3) #{@rule_3}"
  end

  def tower_choice(input_letter)
    case input_letter
    when "a"
      @tower_a
    when "b"
      @tower_b
    when "c"
      @tower_c
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
    case type
    when "big_disk"
      puts @rule_3
    when "empty_tower"
      puts "There is no disk in that tower to move."
    end
  end

  def valid_input?(input)        #check if user input is valid & quit option
    towers = ["a", "b", "c"]
    good_input = false           #whether input is valid

    if input == "q"
      quit
    elsif (towers.include? input[0]) && (towers.include? input[2]) && input.length == 3
      good_input = true
    else
      puts "I do not understand. The towers are a, b, and c. #{@instruction}"
    end

    good_input
  end

  def valid_move?(move)         #check if disk moved is smaller than the one it's stacked on
    @from = tower_choice(move[0])
    @to = tower_choice(move[2])
    if @from.empty?
      errors("empty_tower")
      good_move = false
    elsif !@to.empty? && @from[-1] > @to[-1]
      errors("big_disk")
      good_move = false
    else
      good_move = true
    end
    good_move
  end


  ##--GAME PLAY--##

  def move_disk
    @to << @from.pop
  end

  def render          #prints current state of tower
    space = @goal_tower.size * 2

    (@goal_tower.size - 1).downto (0) do |row|
      if @tower_a[row].nil?
        print " " * (space + space/4)
      else
        print "+" * @tower_a[row] + " " * (space + 1 - @tower_a[row])
      end

      if @tower_b[row].nil?
        print " " * (space + space/4)
      else
        print "+" * @tower_b[row] + " " * (space + 1 - @tower_b[row])
      end

      if @tower_c[row].nil?
        print " " * space
      else
        print "+" * @tower_c[row]
      end
      print "\n"
    end
    puts "A" + " " * space + "B" + " " * (space + space/4) + "C"

  end

  def play            #game loop w/ quit option
    introduction
    rules
    render
    until game_won?
      puts "Your move:"
      move = gets.downcase.chomp
      if valid_input?(move) && valid_move?(move)
        move_disk
        render
      else
        puts @instruction
      end
    end
    puts "Congratulations! You did it!"
  end

end

test = TowerOfHanoi.new(5)
test.play