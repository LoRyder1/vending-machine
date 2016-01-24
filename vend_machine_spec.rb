require_relative 'vend_machine'

describe VendingMachine do
  before(:each) do 
    @coin = VendingMachine.new
  end

  describe 'insert_coin' do
    it 'coin should be instance of class VendingMachine' do
      expect(@coin.class).to eq(VendingMachine)
    end

    it 'should accept valid coins: nickels, dimes, quarters' do
      expect(@coin.insert_coin(2,2)).to eq true
      expect(@coin.insert_coin(1,1)).to eq true
      expect(@coin.insert_coin(3,3)).to eq true
    end

    it 'should reject invalid coin with different weight or size' do
      expect(@coin.insert_coin(4,1)).to eq false
      expect(@coin.insert_coin(1,4)).to eq false
    end
  end
end
