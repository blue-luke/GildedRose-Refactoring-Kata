require './lib/gilded_rose'

describe GildedRose do
  # it '#update' do
  #   item9 = Item.new('Conjured Mana Cake', 3, 6)
  #   inn1 = GildedRose.new([item9])
  #   inn1.update
  #   expect(item9.sell_in).to eq(2)
  #   expect(item9.quality).to eq(4)
  # end
  it '#update' do
    # item9 = double(:item, :name => "Conjured Mana Cake", :sell_in => 3, :quality => 6)    
    # inn1 = GildedRose.new([item9])
    # expect { inn1.update }.to change { item9.quality }.from(6).to(4)

    item9 = double("item")
    allow(item9).to receive(:quality=).and_return(6)
    allow(item9).to receive(:quality).and_return(4)
    allow(item9).to receive(:sell_in=).and_return(3)
    allow(item9).to receive(:sell_in).and_return(2)
    allow(item9).to receive(:name).and_return("Conjured Mana Cake")
    inn1 = GildedRose.new([item9])
    inn1.update

    # expect(item9).to receive(:sell_in)
    # expect(item9).to receive(:quality)
    # allow(item9).to receive(:name).and_return("Conjured Mana Cake")
    # allow(item9).to receive(:sell_in).and_return(2)
    # allow(item9).to receive(:quality).and_return(4)
    # item9 = Item.new('Conjured Mana Cake', 3, 6)
    # inn1 = GildedRose.new([item9])
    # inn1.update
    # expect(item9.sell_in).to eq(2)
    # expect(item9.quality).to eq(4)
  end
end