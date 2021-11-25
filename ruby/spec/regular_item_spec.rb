require_relative '../lib/items/regular_item'

describe 'RegularItem' do
  it 'decreases quality by 1, decreases sell in by 1 when sell in 0 or more' do
    item1 = RegularItem.new('+5 Dexterity Vest', 10, 20)
    inn1 = GildedRose.new([item1])
    inn1.update
    expect(item1.sell_in).to eq(9)
    expect(item1.quality).to eq(19)
  end
  it 'decreases quality by 2, decreases sell in by 1 when sell in less than 0' do
    item1 = RegularItem.new('+5 Dexterity Vest', -1, 20)
    inn1 = GildedRose.new([item1])
    inn1.update
    expect(item1.sell_in).to eq(-2)
    expect(item1.quality).to eq(18)
  end
end
