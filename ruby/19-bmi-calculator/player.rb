class Player

  attr_accessor :name, :weight, :height, :picture

  def initialize
    @name = "Player One"
    @height = 6 * 12
    @weight = 176
    @picture = Gosu::Image.new("pics/matrix-business-cat.png")
  end

  def bmi
    ((weight.to_f / (height.to_f**2)) * 703).round(1)
  end

  def to_s
    "#{name} is #{display_height} and weighs #{weight} lbs (BMI: #{bmi})"
  end

  private

  def display_height
    return "#{feet}'" unless inches > 0
    "#{feet}' #{inches}\""
  end

  def feet
    height / 12
  end

  def inches
    height % 12
  end

end
