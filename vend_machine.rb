# Vending Machine Kata

# Accept Coins: nickels, dimes, quarters

# coin/weight/size
# nickels/2/2
# dimes/1/1
# quarters/3/3

def insert_coin(weight, size)
  good_weight = [1,2,3].include? weight
  good_size = [1,2,3].include? size
  
  if good_weight && good_size
    true
  else
    false
  end
end
