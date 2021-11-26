# frozen_string_literal: true

require_relative '../item'

class RegularItem < Item

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
    @min_quality = 0
    @max_quality = 50
    @regular_degrade = 1
    @advanced_degrade = @regular_degrade * 2
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
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
    if @sell_in >= 0
      @quality -= @regular_degrade
    elsif @sell_in.negative?
      @quality -= @advanced_degrade
    end
    check_quality_range(@quality)
  end
end
