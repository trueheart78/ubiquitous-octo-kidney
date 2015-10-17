#!/usr/bin/env ruby
class Rectangle
  attr_accessor :width, :length
  
  def initialize
    @width = 20
    @length = 15
  end
  def square_feet
    @width * @length
  end

  def square_meters
    square_feet * 0.09290304
  end
end

rectangle = Rectangle.new
if ARGV.length > 0
  rectangle.width = ARGV.shift.to_i
end
if ARGV.length > 0
  rectangle.length = ARGV.shift.to_i
end
puts "Rectangle is #{rectangle.width} x #{rectangle.length} feet"
puts "#{rectangle.square_feet} square feet"
puts "#{rectangle.square_meters} square meters"
