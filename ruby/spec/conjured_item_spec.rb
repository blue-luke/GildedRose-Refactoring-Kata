# frozen_string_literal: true

require_relative '../lib/items/conjured_item'

describe 'ConjuredItem' do
  it 'reduces quality by 2, decreases sell in by 1 when sell in 0 or more' do
    item9 = ConjuredItem.new('Conjured Mana Cake', 3, 6)
    item9.update
    expect(item9.sell_in).to eq(2)
    expect(item9.quality).to eq(4)
  end
  it 'reduces quality by 4, decreases sell in by 1 when sell in less than 0' do
    item9 = ConjuredItem.new('Conjured Mana Cake', 0, 6)
    item9.update
    expect(item9.sell_in).to eq(-1)
    expect(item9.quality).to eq(2)
  end
end
