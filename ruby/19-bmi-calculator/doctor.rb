class Doctor

  attr_accessor :name, :picture

  def initialize
    @name = "Dr. Bizness"
    @picture = Gosu::Image.new("pics/business-cat-900.png")
  end

  def to_s
    "Hello. I am #{name}"
  end

  def greeting
    "Hello, is it me you're looking for?"
  end

  def advice(bmi)
    if bmi < 18.5
      "You need fluff!"
    elsif (bmi >= 18.5 and bmi <= 25)
      "You are purrfect."
    else
      "Did you eat the dog!?"
    end
  end

end
