# frozen_string_literal: true

require_relative '../item'

class BackstagePassItem < Item
  def initialize(name, sell_in, quality)
    super
    @min_quality = 0
    @max_quality = 50
  end

  def check_quality_range(_quality)
    if @quality < @min_quality
      @quality = @min_quality
    elsif @quality > @max_quality
      @quality = @max_quality
    end
  end

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
    elsif @sell_in.negative?
      @quality = @min_quality
    end
    check_quality_range(@quality)
  end
end
