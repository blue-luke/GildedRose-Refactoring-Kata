# frozen_string_literal: true

require_relative '../item'

class LegendaryItem < Item
  def update
    update_sell_in
    update_quality
  end

  def update_sell_in
    nil
  end

  def update_quality
    nil
  end
end
