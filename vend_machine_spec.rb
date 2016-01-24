require_relative 'vend_machine'

describe 'insert_coins' do
  it 'should accept valid coins: nickels, dimes, quarters' do
    expect(insert_coin(2,2)).to eq true
    expect(insert_coin(1,1)).to eq true
    expect(insert_coin(3,3)).to eq true
  end
end

# and reject invalid ones