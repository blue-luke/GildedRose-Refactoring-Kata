require './lib/item'

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
      update_sell_in(item)
      update_quality(item)
    end
  end

  def update_sell_in(item)
    if !item.name.include?("Sulfuras")
      item.sell_in -= @time_period
    end
  end

  def update_quality(item)
    if item.name.include?("Brie")
      change_brie_quality(item)
    elsif item.name.include?("Conjured")
      change_conjured_item_quality(item)
    elsif item.name.include?("Backstage passes")
      change_backstage_pass_quality(item)
    elsif item.name.include?("Sulfuras")
      return
    else change_regular_item_quality(item)
    end
  end

  def change_brie_quality(brie)
    if brie.quality < @highest_quality
      brie.quality += 1
    end
  end

  def change_backstage_pass_quality(backstage_pass)
    if backstage_pass.sell_in >= 11
      backstage_pass.quality += 1
    elsif backstage_pass.sell_in <= 10 && backstage_pass.sell_in >= 6
      backstage_pass.quality += 2
    elsif backstage_pass.sell_in <= 5 && backstage_pass.sell_in >= 0
      backstage_pass.quality += 3
    elsif backstage_pass.sell_in < 0
      backstage_pass.quality = 0
    end
    check_quality_range(backstage_pass.quality)
  end

  def change_conjured_item_quality(conjured_item)
    if conjured_item.sell_in >= @lowest_quality
      conjured_item.quality -= @conjured_degrade
    elsif conjured_item.sell_in < @lowest_quality
      conjured_item.quality -= @conjured_advanced_degrade
    end
    check_quality_range(conjured_item.quality)
  end

  def change_regular_item_quality(regular_item)
    if regular_item.sell_in >= @lowest_quality
      regular_item.quality -= @regular_degrade
    elsif regular_item.sell_in < @lowest_quality
      regular_item.quality -= @advanced_degrade
    end
  end

  def check_quality_range(quality)
    if quality < @lowest_quality
      quality = @lowest_quality
    elsif quality > @highest_quality
      quality = @highest_quality
    end
  end

end