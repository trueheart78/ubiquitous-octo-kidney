#!/usr/bin/env ruby
require 'gosu'

class PizzaParty < Gosu::Window

  def initialize
    @pizza_pic = Gosu::Image.new('party.jpg')
    super @pizza_pic.width, @pizza_pic.height + 100
    self.caption = "Pizza Party!"

    @font = Gosu::Font.new(30)
    @people = 4
    @slices = 2
  end

  def draw
    @pizza_pic.draw(0,100,1)
    @font.draw("Number of people? #{@people}", 20, 0, 2)
    @font.draw("Number of slices each? #{@slices}", 20, 20, 2)
    if @pizza > 0
      message = "Please order #{@pizza} pizzas"
    else
      message = "Warning: Party needs more pizza!"
    end
    @font.draw(message, 20, 60, 2)
    @font.draw("#{@leftover} slices leftover", 20, 80, 2)
  end

  def update
    close if button_down? Gosu::KbEscape or button_down? Gosu::KbQ
    @people += 1 if button_down? Gosu::KbUp
    @people -= 1 if @people > 1 and button_down? Gosu::KbDown
    @slices += 1 if button_down? Gosu::KbRight
    @slices -= 1 if @slices > 1 and button_down? Gosu::KbLeft 
    @pizza = @slices * @people / 8
    @leftover = @slices * @people % 8
  end
end
PizzaParty.new.show
