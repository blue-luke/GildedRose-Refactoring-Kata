require_relative '../item'

class BackstagePassItem < Item

  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    @sell_in -= 1
  end

  def update_quality
    if @sell_in >= 11
      @quality += 1
    elsif @sell_in <= 10 && @sell_in >= 6
      @quality += 2
    elsif @sell_in <= 5 && @sell_in >= 0
      @quality += 3
    elsif @sell_in < 0
      @quality = @min_quality
    end
    check_quality_range(@quality)
  end

end