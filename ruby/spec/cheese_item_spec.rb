require_relative '../lib/items/cheese_item'

describe 'CheeseItem' do
  describe '#update_quality' do
    it 'increases quality by 1, decreases sell in by 1 ' do
      item2 = CheeseItem.new('Aged Brie', 2, 0)
      item2.update
      expect(item2.sell_in).to eq(1)
      expect(item2.quality).to eq(1)
    end
    it 'quality of an item never exceeds 50' do
      item2 = CheeseItem.new('Aged Brie', 2, 50)
      item2.update
      expect(item2.sell_in).to eq(1)
      expect(item2.quality).to eq(50)
    end
  end
end