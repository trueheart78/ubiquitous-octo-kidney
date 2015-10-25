class AdvancedPlayer

  attr_accessor :name, :weight, :height, :picture, :units

  def initialize
    @name = "Matrix Cat"
    @height = 65
    @weight = 163
    @units = :imperial
    @picture = Gosu::Image.new("pics/matrix-business-cat.png")
  end

  def change_type
    if units == :metric
      @units = :imperial
    else
      @units = :metric
    end
    convert_height
    convert_weight
  end

  def bmi
    if units == :imperial
      ((weight.to_f / height.to_f**2) * 703).round(1)
    else
      (weight.to_f / height.to_f**2).round(1)
    end
  end

  def to_s
    "#{name} is #{display_height} and #{display_weight} (BMI: #{bmi})"
  end

  def display_units
    units.to_s.capitalize
  end

  def display_height
    if units == :imperial
      return "#{feet}'" unless inches > 0
      "#{feet}' #{inches}\""
    else
      "#{height} #{length_label}"
    end
  end

  def display_weight
    "#{weight} #{weight_label}"
  end

  private

  def convert_height
    #convert from imperial
    @height = (@height * 2.54).to_i if units == :metric
    #convert from metric
    @height = (@height * 0.394).to_i if units == :imperial
  end

  def convert_weight
    #convert from imperial
    @weight = (@weight * 0.454).to_i if units == :metric
    #convert from metric
    @weight = (@weight * 2.205).to_i if units == :imperial
  end

  def feet
    height / 12
  end

  def inches
    height % 12
  end

  def length_label
    return "cm" if units == :metric
    "inches"
  end

  def weight_label
    return "kg" if units == :metric
    "lb"
  end

end
