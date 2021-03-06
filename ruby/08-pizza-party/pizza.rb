#!/usr/bin/env ruby
require 'gosu'

class PizzaParty < Gosu::Window

  def initialize
    @pizza_pic = Gosu::Image.new('party.jpg')
    super @pizza_pic.width, @pizza_pic.height + 100
    self.caption = "Pizza Party!"

    @font = Gosu::Font.new(24)
    @pizza = 1
    @people = 4
  end

  def draw
    @pizza_pic.draw(0,100,1)
    @font.draw("Number of people? #{@people}", 20, 0, 2)
    @font.draw("Number of pizzas? #{@pizza}", 20, 20, 2)
    if @slices > 0
      message = "Each person gets #{@slices} slices"
    else
      message = "Warning: Party needs more pizza!"
    end
    @font.draw(message, 20, 60, 2)
    if @slices > 0
      @font.draw("#{@leftover} slices leftover", 20, 80, 2)
    end
  end

  def update
    close if button_down? Gosu::KbEscape or button_down? Gosu::KbQ
    @people += 1 if button_down? Gosu::KbUp
    @people -= 1 if @people > 1 and button_down? Gosu::KbDown
    @pizza += 1 if button_down? Gosu::KbRight
    @pizza -= 1 if @pizza > 1 and button_down? Gosu::KbLeft 
    @slices = @pizza * 8 / @people
    @leftover = 0
    if @slices > 0
      @leftover = (@pizza * 8) % @slices
    end

  end

end
PizzaParty.new.show
