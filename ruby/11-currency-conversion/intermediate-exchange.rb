#!/usr/bin/env ruby
require 'gosu'

class CurrencyConversion < Gosu::Window

  def initialize
    @euro_coin = Gosu::Image.new('euro-coin.png')
    @dollar_bill = Gosu::Image.new('dollar-bill.png')
    @money_pic = Gosu::Image.new('usd.jpg')
    super 600, 480
    self.caption = "Intermediate Currency Conversion"
    @font = Gosu::Font.new(30)
    @from_amount = 81
    @from_currency = :euro
    @to_currency = :dollar
    @from_rates = {euro: 1.13, dollar: 0.88}
    @state = :select_currency
  end

  def draw
    if @state == :select_currency
      @font.draw("Which do you have? (click one)", 20, 20, 2)
      @euro_coin.draw(1,100,2,0.25,0.25)
      @dollar_bill.draw(200,100,2,0.15,0.15)

      @font.draw("[E]uros",30,240,2)
      @font.draw("[U]S Dollars",260,240,2)

      @font.draw("[N]ext: Enter Currency", 20, 400, 1)
      @font.draw("[Q]uit", 20, 420, 1)
    elsif @state == :enter_amount
      euro_message = "How many #{@from_currency}s? <c=ffff00>#{@from_amount}</c>"
      @font.draw(euro_message, 20, 0,1)
      
      @font.draw("[C]onvert Monies", 20, 420, 1)
      @font.draw("[S]elect Type", 20, 400, 1)
      @font.draw("[Q]uit", 20, 440, 1)
    elsif @state == :convert_monies
      @font.draw("Exchange rate from #{@from_currency} to #{@to_currency}: #{@from_rates[@from_currency]}", 20, 20, 2)
      @font.draw("You have #{convert_amount} #{@to_currency}s from your #{@from_amount} #{@from_currency}s", 20, 50, 2)
     
      @font.draw("[S]elect Type", 20, 400, 1)
      @font.draw("[E]nter Currency", 20, 420, 1)
      @font.draw("[Q]uit", 20, 440, 1)
    end
  end

  def update
    close if button_down? Gosu::KbEscape or button_down? Gosu::KbQ
    case @state
    when :select_currency
      # perform mouse-click on images to select 'from'
      @from_currency = :euro if button_down? Gosu::KbE
      @from_currency = :dollar if button_down? Gosu::KbU
      @state = :enter_amount if button_down? Gosu::KbN
    when :enter_amount
      @from_amount += 1 if button_down? Gosu::KbUp
      @from_amount -= 1 if @from_amount > 1 and button_down? Gosu::KbDown
      @state = :convert_monies if button_down? Gosu::KbC
      @state = :select_currency if button_down? Gosu::KbS
    when :convert_monies
      @state = :select_currency if button_down? Gosu::KbS
      @state = :enter_amount if button_down? Gosu::KbE
    end
  end

  def convert_amount
    (@from_amount * @from_rates[@from_currency] / 100).round(2)
  end
end
CurrencyConversion.new.show
