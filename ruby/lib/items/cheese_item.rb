require_relative '../item'

class CheeseItem < Item

  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    if @sell_in >= 0
      @quality += 1
    end
    check_quality_range(@quality)
  end

end