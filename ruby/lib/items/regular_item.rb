require_relative '../item'

class RegularItem < Item

  def update_quality
    if @sell_in >= 0
      @quality -= @regular_degrade
    elsif @sell_in < 0
      @quality -= @advanced_degrade
    end
    check_quality_range(@quality)
  end

end