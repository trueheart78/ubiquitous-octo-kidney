module KeyBindings

  def on_increase &block
    if !@increasing and increase?
      yield
      @increasing = true
    elsif @increasing and !increase?
      @increasing = false
    end
  end

  def on_decrease &block
    if !@decreasing and decrease?
      yield
      @decreasing = true
    elsif @decreasing and !decrease?
      @decreasing = false
    end
  end

  def on_forward &block
    if !@nexting and next?
      yield
      @nexting = true
    elsif @nexting and !next?
      @nexting = false
    end
  end

  def on_backward &block
    if !@previousing and previous?
      yield
      @previousing = true
    elsif @previousing and !previous?
      @previousing = false
    end
  end

  def on_confirm &block
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
