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

  def validate coin
    w = valid?(coin.weight)
    s = valid?(coin.size)
    if w && s
      add_amount(coin)
      true
    else
      false
    end
  end

  def valid?(value)
    [1,2,3].include?(value)
  end

  def add_amount(coin)
    w = coin.weight
    s = coin.size
    case 
    when w == 2 && s == 2
      @current_amount += 5
    when w == 1 && s == 1
      @current_amount += 10
    when w == 3 && s == 3
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

# cola = Product.new("cola",100,0)
# chips = Product.new("chips",50,5)
# candy = Product.new("candy",65,5)

# dime = Coin.new(1,1)
# nickel = Coin.new(2,2)
# quarter = Coin.new(3,3)
# bad = Coin.new(1,4)

# x = VendingMachine.new

# p cola.available?
# p chips.available?