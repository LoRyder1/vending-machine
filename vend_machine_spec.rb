require_relative 'vend_machine'

describe VendingMachine do
  before(:each) do 
    @vending = VendingMachine.new
  end

  describe 'initialize' do
    it 'vending should be instance of class VendingMachine' do
      expect(@vending.class).to eq(VendingMachine)
    end

    it 'starting amount should be zero'do
      expect(@vending.current_amount).to eq 0
    end
  end

  describe 'validate' do
    it 'should accept valid coins: nickels, dimes, quarters' do
      expect(@vending.validate(2,2)).to eq true
      expect(@vending.validate(1,1)).to eq true
      expect(@vending.validate(3,3)).to eq true
    end

    it 'should reject invalid coin with different weight or size' do
      expect(@vending.validate(4,1)).to eq false
      expect(@vending.validate(1,4)).to eq false
    end
  end

  describe 'add_amount' do
    it 'when valid coin is added, the value is added to current amount' do
      @vending.validate(1,1)
      expect(@vending.current_amount).to eq 10
    end
  end

  describe 'display' do
    it 'updates the display with coin amount' do
      @vending.validate(1,1)
      expect(@vending.display).to eq "10"
    end

    it "when no coin is inserted the display reads 'INSERT COIN'" do
      expect(@vending.display).to eq "INSERT COIN"
    end
  end

  describe 'select' do
    it "dispenses product if enough change with display 'THANK YOU'" do
      @vending.validate(3,3)
      @vending.validate(3,3)
      @vending.select("chips")
      expect(@vending.display).to eq 'THANK YOU'
    end

    it "after displaying 'THANK YOU' machine next displays 'INSERT COIN'" do
      @vending.validate(3,3)
      @vending.validate(3,3)
      @vending.select("chips")
      @vending.display
      expect(@vending.display).to eq 'INSERT COIN'
    end

    it "if not enough money display 'PRICE: x'" do
      @vending.validate(3,3)
      @vending.validate(3,3)
      @vending.select("candy")
      expect(@vending.display).to eq 'PRICE: 65'
    end

    it 'subsequent checks after not enough display current amount if there is money' do
      @vending.validate(3,3)
      @vending.validate(3,3)
      @vending.select("candy")
      @vending.display
      expect(@vending.display).to eq '50'
    end

    it "subsequent checks after not enough display INSERT COIN' if no money" do
      @vending.select("candy")
      expect(@vending.display).to eq 'PRICE: 65'
      expect(@vending.display).to eq 'INSERT COIN'
    end

    it "coin return collects leftover money after selection" do
      @vending.validate(3,3)
      @vending.validate(3,3)
      @vending.validate(1,1)
      @vending.select("chips")
      expect(@vending.coin_return).to eq 10
    end
  end

  describe 'return_coin' do
    it "returns current amount of money in machine and display shows 'INSERT COIN'" do
      @vending.validate(3,3)
      expect(@vending.return_coin).to eq 25
      expect(@vending.current_amount).to eq 0
      expect(@vending.display).to eq 'INSERT COIN'
    end
  end

  describe 'when product is SOLD OUT' do
    it 'after selecting a product check to see if SOLD OUT' do
      @vending.select("cola")
      expect(@vending.display).to eq 'SOLD OUT'
    end
  end
end
