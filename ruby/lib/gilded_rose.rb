require_relative './item'

class GildedRose

  def initialize(items)
    @items = items
    @time_period = 1
    @regular_degrade = 1
    @advanced_degrade = @regular_degrade * 2
    @conjured_degrade = @regular_degrade * 2
    @conjured_advanced_degrade = @advanced_degrade * 2
    @lowest_quality = 0
    @highest_quality = 50
  end

  def update()
    @items.each do |item|
      item.update
    end
  end

end