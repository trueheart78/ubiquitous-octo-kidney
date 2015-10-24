class Doctor

  attr_accessor :name, :picture

  def initialize
    @name = "Dr. Acula"
    @picture = Gosu::Image.new("pics/business-cat-900.png")
  end

  def to_s
    "Hello. I am #{name} - it's pleasure to meet you"
  end

  def advice(bmi)
    return "holding back - please tell me meow."
    if bmi < 18.5
      "underweight - you need to eat more cheeseburgers"
    elsif (bmi >= 18.5 and bmi <= 25)
      "looking good - eating the right amount of cheeseburgers"
    else
      "overweight - you are eating too many cheeseburgers."
    end
  end
end
