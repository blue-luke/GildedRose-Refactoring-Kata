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

# Change update_quality to update, as it updates more than quality
# Have two sub-methods, one for sell_in
# And one for quality
# Quality method should be restructued 