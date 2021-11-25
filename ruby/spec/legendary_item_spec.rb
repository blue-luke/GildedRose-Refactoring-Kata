require_relative '../lib/items/legendary_item'

describe 'LegendaryItem' do
  it 'keeps quality the same, keeps sell in the same' do
    item4 = LegendaryItem.new('Sulfuras, Hand of Ragnaros', 0, 80)
    inn1 = GildedRose.new([item4])
    inn1.update
    expect(item4.sell_in).to eq(0)
    expect(item4.quality).to eq(80)
  end
end