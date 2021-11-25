require './lib/gilded_rose'

describe GildedRose do
  it '#update' do
    item9 = Item.new('Conjured Mana Cake', 3, 6)
    inn1 = GildedRose.new([item9])
    inn1.update
    expect(item9.sell_in).to eq(2)
    expect(item9.quality).to eq(4)
  end
end

# Have case-when structure
# Detect name
# Direct to a specific decrease quality method
# Increase quality of brie 
# Increase quality of baackstage passes, additional rules
# Decrease quality on conjured by 2
# Decrease quality of others by 1