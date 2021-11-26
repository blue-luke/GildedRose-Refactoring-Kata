# frozen_string_literal: true

require_relative '../lib/items/backstage_pass_item'

describe 'BackstagePassItem' do
  it 'increases quality by 1, decreases sell in by 1 when 11 or more days' do
    item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
    item6.update
    expect(item6.sell_in).to eq(14)
    expect(item6.quality).to eq(21)
  end
  it 'quality drops to 0 when sell in less than 0' do
    item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)
    item6.update
    expect(item6.sell_in).to eq(-1)
    expect(item6.quality).to eq(0)
  end
  it 'increases quality by 2 when 10 or fewer days' do
    item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 8, 48)
    item6.update
    expect(item6.sell_in).to eq(7)
    expect(item6.quality).to eq(50)
  end
  it 'increases quality by 3 when 5 or fewer days' do
    item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 4, 47)
    item6.update
    expect(item6.sell_in).to eq(3)
    expect(item6.quality).to eq(50)
  end
  it 'max quality of 50' do
    item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 4, 48)
    item6.update
    expect(item6.sell_in).to eq(3)
    expect(item6.quality).to eq(50)
  end
end
