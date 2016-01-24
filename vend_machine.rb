# Vending Machine Kata

# Accept Coins: nickels, dimes, quarters

# coin/weight/size
# nickels/2/2
# dimes/1/1
# quarters/3/3

class VendingMachine
  attr_reader :current_amount
  def initialize
    @current_amount = 0
    @weight = nil
    @size = nil
  end

  def validate(weight, size)
    @weight = weight
    @size = size

    okay_weight = [1,2,3].include? weight
    okay_size = [1,2,3].include? size
    
    if okay_weight && okay_size
      add_amount
      true
    else
      false
    end
  end

  def add_amount
    case 
    when @weight == 2 && @size == 2
      @current_amount += 5
    when @weight == 1 && @size == 1
      @current_amount += 10
    when @weight == 3 && @size == 3
      @current_amount += 25
    end
  end
end


# x = VendingMachine.new

# x.validate(1,1)
# x.validate(2,2)
# x.validate(3,3)
# p x.current_amount
