#!/usr/bin/env ruby
require 'gosu'

class CurrencyConversion < Gosu::Window

  def initialize
    @money_pic = Gosu::Image.new('usd.jpg')
    super @money_pic.width, @money_pic.height + 100
    self.caption = "Basic Currency Conversion"
    @font = Gosu::Font.new(30)
    @euros = 81
    @rate = 137.51
    @state = :euros
  end

  def draw
    @money_pic.draw(0,100,1)
    if @state == :euros
      euro_message = "Euros? <c=ffff00>#{@euros}</c>"
    else
      euro_message = "Euros? #{@euros}"
    end
    @font.draw(euro_message, 20, 0, 99)

    if @state == :rate
      rate_message = "Exchange rate? <c=ffff00>#{@rate}</c>"
    else
      rate_message = "Exchange rate? #{@rate}"
    end
    @font.draw(rate_message, 20, 20, 2)
    @font.draw(@state.to_s, 20, 90, 2)
    
    @font.draw("#{usd} U.S. dollars", 20, 50, 2)
  end

  def update
    close if button_down? Gosu::KbEscape or button_down? Gosu::KbQ
    case @state
    when :euros
      @euros += 1 if button_down? Gosu::KbUp
      @euros -= 1 if @euros > 1 and button_down? Gosu::KbDown
      @state = :rate if button_down? Gosu::KbReturn or button_down? Gosu::KbRight
    when :rate
      @rate += 0.01 if button_down? Gosu::KbUp
      @rate -= 0.01 if @rate > 0.01 and button_down? Gosu::KbDown
      @rate = @rate.round(2)
      @state = :euros if button_down? Gosu::KbReturn or button_down? Gosu::KbLeft
    end
  end

  def usd
    (@euros * @rate / 100).round(2)
  end
end
CurrencyConversion.new.show
