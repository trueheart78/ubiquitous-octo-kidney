class Password

  def initialize(password)
    @password = password
  end

  def check_strength
    return :weak if weak?
    return :strong if strong?
    :very_strong if very_strong?
  end

  private

  def weak?
    too_short? || all_numbers? || all_letters?
  end

  def strong?
    !weak? && !has_symbols?
  end

  def very_strong?
    !weak? && has_symbols?
  end

  def too_short?
    @password.length < 8
  end

  def all_numbers?
    @password[/[0-9]+/] == @password
  end

  def all_letters?
    @password[/[a-zA-Z]+/] == @password
  end

  def has_symbols?
    @password[/[a-zA-Z0-9]+/] != @password
  end

end
