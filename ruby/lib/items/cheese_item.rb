require_relative '../item'

class CheeseItem < Item

  def update_quality
    if @sell_in >= 0
      @quality += 1
    end
    check_quality_range(@quality)
  end

end