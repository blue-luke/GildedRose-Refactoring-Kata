require './lib/gilded_rose'

describe GildedRose do
  describe '#update' do
    it 'reduces conjured item quality by 2' do
      item9 = Item.new('Conjured Mana Cake', 3, 6)
      inn1 = GildedRose.new([item9])
      inn1.update
      expect(item9.sell_in).to eq(2)
      expect(item9.quality).to eq(4)
    end
    it 'reduces conjured item quality by 2' do
      item9 = Item.new('Conjured Mana Cake', 3, 6)
      inn1 = GildedRose.new([item9])
      inn1.update
      expect(item9.sell_in).to eq(2)
      expect(item9.quality).to eq(4)
    end
  end
end