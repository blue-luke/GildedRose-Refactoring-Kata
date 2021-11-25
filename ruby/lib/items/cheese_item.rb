# frozen_string_literal: true

require_relative '../item'

class CheeseItem < Item
  def update_quality
    @quality += 1 if @sell_in >= 0
    check_quality_range(@quality)
  end
end
