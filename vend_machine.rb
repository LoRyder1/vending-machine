require 'pry'
# Vending Machine Kata

# Accept Coins: nickels, dimes, quarters

# coin/weight/size
# nickels/2/2
# dimes/1/1
# quarters/3/3

class VendingMachine
  PRODUCTS = {"cola":100 , "chips":50, "candy":65}
  attr_reader :current_amount, :coin_return
  def initialize
    @current_amount = 0
    @coin_return = 0
    @weight = nil
    @size = nil
    @mesg = nil
  end

  def display
    current_display = @mesg
    if @mesg != nil
      @mesg = nil
      current_display
    elsif @current_amount == 0
      "INSERT COIN"
    else
      @current_amount.to_s  
    end
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

  def select(product)
    price = PRODUCTS[product.to_sym]
    if price <= @current_amount
      @current_amount -= price
      @coin_return = @current_amount
      @current_amount = 0
      @mesg = 'THANK YOU'
    elsif price > @current_amount
      @mesg = "PRICE: #{price}"
    end
  end
end
