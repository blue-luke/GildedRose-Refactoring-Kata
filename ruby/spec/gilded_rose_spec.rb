require './lib/gilded_rose'

describe GildedRose do
  it '#update_quality' do
    item9 = Item.new('Conjured Mana Cake', 3, 6)
    inn1 = GildedRose.new([item9])
    inn1.update_quality
    expect(item9.sell_in).to eq(2)
    expect(item9.quality).to eq(4)
  end
end