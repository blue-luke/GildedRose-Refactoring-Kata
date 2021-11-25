class GildedRose

  def initialize(items)
    @items = items
  end

  def update()
    @items.each do |item|
      update_quality(item)
      update_sell_in(item)
    end
  end

  def update_sell_in(item)
    if item.name != "Sulfuras, Hand of Ragnaros"
      item.sell_in = item.sell_in - 1
    end
  end

  def update_quality(item)

    # case item.name
    # when item.name.include?("Brie")
    #   change_brie_quality(item)
    # when item.name.include?("Conjured")
    #   change_conjured_item_quality(item)
    # when item.name.include?("Backstage passes")
    #   change_backstage_pass_quality(item)
    # when item.name.include?("Sulfuras")
    # else change_regular_item_quality(item)
    # end

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
    if brie.quality < 50
      brie.quality += 1
    end
  end

  def change_backstage_pass_quality(backstage_pass)
    case backstage_pass.sell_in
    when backstage_pass.sell_in >= 11
      backstage_pass.quality += 1
    when backstage_pass.sell_in <= 10 && backstage_pass.sell_in >=6
      backstage_pass.quality += 2
    when backstage_pass.sell_in <= 5
      backstage_pass.quality += 3
    end
    check_quality_range(backstage_pass.quality)
  end

  def change_conjured_item_quality(conjured_item)
    if conjured_item.quality > 0
      conjured_item.quality -= 2
    end
    check_quality_range(conjured_item.quality)
  end

  def change_regular_item_quality(regular_item)
    if regular_item.quality > 0
      regular_item.quality -= 1
    end
  end

  def check_quality_range(quality)
    if quality < 0
      quality = 0
    elsif quality > 50
      quality = 50
    end
  end

end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end







      # if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      #   if item.quality > 0
      #     if item.name != "Sulfuras, Hand of Ragnaros" and !item.name.include? "Conjured"
      #       item.quality = item.quality - 1
      #     elsif item.name != "Sulfuras, Hand of Ragnaros" and item.name.include? "Conjured"
      #       item.quality = item.quality - 2
      #     end
      #   end
      # else
      #   if item.quality < 50
      #     item.quality = item.quality + 1
      #     if item.name == "Backstage passes to a TAFKAL80ETC concert"
      #       if item.sell_in < 11
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #       if item.sell_in < 6
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #     end
      #   end
      # end
      # if item.sell_in < 0
      #   if item.name != "Aged Brie"
      #     if item.name != "Backstage passes to a TAFKAL80ETC concert"
      #       if item.quality > 0
      #         if item.name != "Sulfuras, Hand of Ragnaros"
      #           item.quality = item.quality - 1
      #         end
      #       end
      #     else
      #       item.quality = item.quality - item.quality
      #     end
      #   else
      #     if item.quality < 50
      #       item.quality = item.quality + 1
      #     end
      #   end
      # end