require './lib/gilded_rose'
require './dummies/item_dummy'
require_relative '../lib/items/regular_item'
require_relative '../lib/items/legendary_item'
require_relative '../lib/items/backstage_pass_item'
require_relative '../lib/items/conjured_item'

describe GildedRose do

  describe '#update refactored' do
  let(:item1) { double :item }
    it 'sends an update message to each item' do
      allow(item1).to receive(:update)
      inn1 = GildedRose.new([item1])
      inn1.update
      expect(item1).to have_received(:update)
    end
  end

  describe '#update' do

    describe 'regular items' do
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

    describe 'sulfuras' do
      it 'keeps quality the same, keeps sell in the same' do
        item4 = LegendaryItem.new('Sulfuras, Hand of Ragnaros', 0, 80)
        inn1 = GildedRose.new([item4])
        inn1.update
        expect(item4.sell_in).to eq(0)
        expect(item4.quality).to eq(80)
      end
    end

    describe 'backstage passes' do
      it 'increases quality by 1, decreases sell in by 1' do
        item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
        inn1 = GildedRose.new([item6])
        inn1.update
        expect(item6.sell_in).to eq(14)
        expect(item6.quality).to eq(21)
      end
      it 'quality drops to 0 when sell in less than 0' do
        item6 = BackstagePassItem.new('Backstage passes to a TAFKAL80ETC concert', 0, 50)
        inn1 = GildedRose.new([item6])
        inn1.update
        expect(item6.sell_in).to eq(-1)
        expect(item6.quality).to eq(0)
      end
    end

    describe 'conjured items' do
      it 'reduces quality by 2, decreases sell in by 1 when sell in 0 or more' do
        item9 = ConjuredItem.new('Conjured Mana Cake', 3, 6)
        inn1 = GildedRose.new([item9])
        inn1.update
        expect(item9.sell_in).to eq(2)
        expect(item9.quality).to eq(4)
      end
      it 'reduces quality by 4, decreases sell in by 1 when sell in less than 0' do
        item9 = ConjuredItem.new('Conjured Mana Cake', 0, 6)
        inn1 = GildedRose.new([item9])
        inn1.update
        expect(item9.sell_in).to eq(-1)
        expect(item9.quality).to eq(2)
      end
    end

  end
end