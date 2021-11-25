require_relative '../item'

class ConjuredItem < Item

  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    if @sell_in >= 0
      @quality -= @regular_degrade * 2
    elsif @sell_in < 0
      @quality -= @advanced_degrade * 2
    end
    check_quality_range(@quality)
  end

end