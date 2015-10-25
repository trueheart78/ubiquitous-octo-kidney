class AdvancedPlayer

  attr_accessor :name, :weight, :height, :picture, :units

  def initialize
    @name = "Matrix Cat"
    @height = 6 * 12
    @weight = 176
    @units = :imperial
    @picture = Gosu::Image.new("pics/matrix-business-cat.png")
  end

  def change_type
    if @units == :metric
      @units = :imperial
    else
      @units = :metric
    end
  end

  def bmi
    ((weight.to_f / (height.to_f**2)) * 703).round(1)
  end

  def to_s
    "#{name} is #{display_height} and weighs #{weight} lbs (BMI: #{bmi})"
  end

  def display_height
    if @units == :imperial
      return "#{feet}'" unless inches > 0
      "#{feet}' #{inches}\""
    else
      "#{height}cm"
    end
  end

  private

  def convert_height
    #convert from imperial
    @height = (@height * 0.394).to_i if @units == :metric
    #convert from metric
    @height = (@height / 2.540).to_i if @units == :imperial
  end

  def convert_weight
    #convert from imperial
    @weight = (@weight / 0.454).to_i if @units == :metric
    #convert from metric
    @weight = (@weight * 2.205).to_i if @units == :imperial
  end

  def feet
    height / 12
  end

  def inches
    height % 12
  end

  def length_label
    return "cm" if @units == :metric
    "inches"
  end

  def weight_label
    return "kg" if @unites == :metric
    "lb"
  end

end
