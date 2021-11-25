# frozen_string_literal: true

require './lib/gilded_rose'

describe GildedRose do
  describe '#update refactored' do
    let(:item1) { double :item }
    let(:item2) { double :item }
    it 'sends an update message to each item' do
      allow(item1).to receive(:update)
      allow(item2).to receive(:update)
      inn1 = GildedRose.new([item1, item2])
      inn1.update
      expect(item1).to have_received(:update)
      expect(item2).to have_received(:update)
    end
  end
end
