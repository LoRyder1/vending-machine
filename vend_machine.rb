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
  end

  def validate(weight, size)
    okay_weight = [1,2,3].include? weight
    okay_size = [1,2,3].include? size
    
    if okay_weight && okay_size
      true
    else
      false
    end
  end
end
