require 'pry'
# Vending Machine Kata

# Accept Coins: nickels, dimes, quarters

# coin/weight/size
# nickels/2/2
# dimes/1/1
# quarters/3/3

class VendingMachine
  attr_reader :current_amount, :coin_return
  attr_accessor :change
  def initialize
    @current_amount = 0
    @coin_return = 0
    @weight = nil
    @size = nil
    @mesg = nil
    @change = true
  end

  def display
    current_display = @mesg
    if @mesg != nil
      @mesg = nil
      current_display
    elsif @current_amount == 0
      @change == false ? "EXACT CHANGE ONLY" : "INSERT COIN"
    else
      @current_amount.to_s  
    end
  end

  def validate weight, size
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

  def select product
    if product.unavailable?
      @mesg = 'SOLD OUT'
    elsif @current_amount >= product.price
      purchase(product.price)
      @mesg = 'THANK YOU'
    elsif @current_amount < product.price
      @mesg = "PRICE: #{product.price}"
    end
  end

  def purchase price
    @current_amount -= price
    @coin_return = @current_amount
    @current_amount = 0
  end

  def return_coin
    to_return = @current_amount
    @current_amount = 0
    display
    to_return
  end
end

class Coin
  attr_reader :weight, :size
  def initialize weight, size
    @weight, @size = weight, size
  end
end

class Product
  attr_reader :name, :price, :quantity
  def initialize name, price, quantity
    @name, @price, @quantity = name, price, quantity
  end

  def unavailable?
    self.quantity == 0 ? true : false
  end
end

cola = Product.new("cola",100,0)
chips = Product.new("chips",50,5)
candy = Product.new("candy",65,5)

dime = Coin.new(1,1)
nickel = Coin.new(2,2)
quarter = Coin.new(3,3)

# p cola.available?
# p chips.available?