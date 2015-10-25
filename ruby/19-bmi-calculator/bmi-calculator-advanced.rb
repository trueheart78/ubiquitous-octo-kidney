#!/usr/bin/env ruby
require 'gosu'
require_relative 'lib/advanced_player'
require_relative 'lib/doctor'
require_relative 'lib/key_bindings'

class BmiCalculator < Gosu::Window

  include KeyBindings

  def initialize
    super 500, 450
    self.caption = "BMI Cat Doctor Advanced"

    @player = AdvancedPlayer.new
    @doctor = Doctor.new
    @font = Gosu::Font.new(24)
    @state = :type
    @colors = { highlight: 'ffff00', normal: 'ffffff' }
  end

  def draw
    @player.picture.draw(0,0,1,0.25,0.25)

    @font.draw("Name: #{@player.name}", 220, 0, 99)

    color = (@state == :type) ? :highlight : :normal
    question = "Units: <c=#{@colors[color]}>#{@player.units}</c>"
    @font.draw(question, 220, 20, 99)

    color = (@state == :height) ? :highlight : :normal
    question = "Height: <c=#{@colors[color]}>#{@player.display_height}</c>"
    @font.draw(question, 220, 40, 99)

    color = (@state == :weight) ? :highlight : :normal
    question = "Weight: <c=#{@colors[color]}>#{@player.weight} lbs</c>"
    @font.draw(question, 220, 60, 99)

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
      @font.draw("<c=#{@colors[color]}>[Visit #{@doctor.name}#{(@visited_doctor)?" Again!":""}]</c>", 220, 110, 99)
    end

    @font.draw("<c=606060>State: #{@state}</c>", 20, 400, 99)
    @font.draw("<c=606060>#{@player}</c>", 20, 425, 99)
  end

  def update
    close if exit?
    case @state
    when :type
      on_increase { @player.change_type }
      on_decrease { @player.change_type }
      on_forward  { @state = :height }
    when :height
      on_increase { @player.height += 1 }
      on_decrease { @player.height -= 1 if @player.height > 36 }
      on_backward { @state = :type }
      on_forward  { @state = :weight }
    when :weight
      on_increase { @player.weight += 1 if @player.weight < 999 }
      on_decrease { @player.weight -= 1 if @player.weight > 75 }
      on_backward { @state = :height }
      on_forward  { @state = :proceed }
    when :proceed
      on_backward { @state = :weight }
      on_confirm  { @state = :advice }
    when :advice
      on_backward { @state = :weight }
      on_confirm  { @state = :doctor }
    when :doctor
      on_backward { @state = :weight }
      @visited_doctor = true
    end
  end

end

BmiCalculator.new.show
