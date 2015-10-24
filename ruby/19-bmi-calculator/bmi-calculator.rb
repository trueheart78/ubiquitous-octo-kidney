#!/usr/bin/env ruby
require 'gosu'
require_relative 'player'
require_relative 'doctor'

class BmiCalculator < Gosu::Window

  def initialize
    super 500, 450
    self.caption = "BMI Cat Doctor"

    @player = Player.new
    @doctor = Doctor.new
    @font = Gosu::Font.new(24)
    @state = :height
    @colors = { highlight: 'ffff00', normal: 'ffffff' }
  end

  def draw
    @player.picture.draw(0,0,1,0.25,0.25)

    @font.draw("Name: #{@player.name}", 220, 0, 99)

    color = (@state == :height) ? :highlight : :normal
    question = "Height: <c=#{@colors[color]}>#{@player.height} inches</c>"
    @font.draw(question, 220, 20, 99)

    color = (@state == :weight) ? :highlight : :normal
    question = "Weight: <c=#{@colors[color]}>#{@player.weight} lbs</c>"
    @font.draw(question, 220, 40, 99)


    if @state == :advice or @state == :doctor
      @doctor.picture.draw(302,220,2,0.22,0.22)
      @font.draw("\"#{@doctor}\"", 50, 220, 99)

      color = (@state == :advice) ? :highlight : :normal
      @font.draw("<c=#{@colors[color]}>Ask: \"Am I too fluffy?\"</c>", 50, 260, 99)
      if @state == :doctor
        @font.draw("\"#{@doctor.advice(@player.bmi)}\"", 50, 300, 99)
      end
    else
      if @visited_doctor
        @font.draw("\"Come back soon!\"", 50, 220, 99)
      end
      color = (@state == :proceed) ? :highlight : :normal
      @font.draw("<c=#{@colors[color]}>[Visit #{@doctor.name}#{(@visited_doctor)?" Again!":""}]</c>", 220, 90, 99)
    end

    @font.draw("<c=606060>State: #{@state}</c>", 20, 400, 99)
    @font.draw("<c=606060>#{@player}</c>", 20, 425, 99)
  end

  def update
    close if exit?
    case @state
    when :height
      increase { @player.height += 1 }
      decrease { @player.height -= 1 if @player.height > 36 }
      forward  { @state = :weight }
    when :weight
      increase { @player.weight += 1 if @player.weight < 999 }
      decrease { @player.weight -= 1 if @player.weight > 75 }
      backward { @state = :height }
      forward  { @state = :proceed }
    when :proceed
      backward { @state = :weight }
      confirm  { @state = :advice }
    when :advice
      backward { @state = :weight }
      confirm  { @state = :doctor }
    when :doctor
      backward { @state = :weight }
      @visited_doctor = true
    end
  end

  def increase &block
    if !@increasing and increase?
      yield
      @increasing = true
    elsif @increasing and !increase?
      @increasing = false
    end
  end

  def decrease &block
    if !@decreasing and decrease?
      yield
      @decreasing = true
    elsif @decreasing and !decrease?
      @decreasing = false
    end
  end

  def forward &block
    if !@nexting and next?
      yield
      @nexting = true
    elsif @nexting and !next?
      @nexting = false
    end
  end

  def backward &block
    if !@previousing and previous?
      yield
      @previousing = true
    elsif @previousing and !previous?
      @previousing = false
    end
  end

  def confirm &block
    if !@confirming and confirm?
      yield
      @confirming = true
    elsif @confirming and !confirm?
      @confirming = false
    end
  end

  def increase?
    button_down? Gosu::KbRight or button_down? Gosu::GpRight or button_down? Gosu::KbL
  end

  def decrease?
    button_down? Gosu::KbLeft or button_down? Gosu::GpLeft or button_down? Gosu::KbH
  end

  def previous?
    button_down? Gosu::KbUp or button_down? Gosu::GpUp or button_down? Gosu::KbK
  end

  def next?
    button_down? Gosu::KbDown or button_down? Gosu::GpDown or button_down? Gosu::KbJ
  end

  def confirm?
    button_down? Gosu::KbReturn or button_down? Gosu::GpButton0
  end

  def exit?
    button_down? Gosu::KbEscape \
      or button_down? Gosu::KbQ \
      or button_down? Gosu::GpButton3
  end
end

BmiCalculator.new.show
