class SondaMoveNotPermitted < StandardError; end

class SondaService
  attr_reader :x, :y, :direction

  def initialize
    start!
  end

  def status
    { x: @x, y: @y }
  end

  def start!
    @x = 0
    @y = 0
    @direction = 'D'
  end

  def move!
    send("move_#{axis}_#{direction_name}")
  end

  private

  def axis
    ['E', 'D'].include?(direction) ? 'x' : 'y'
  end

  def direction_name
    I18n.t("direction.#{direction}")
  end

  def move_x_right
    binding.pry
    raise SondaMoveNotPermitted unless @x + 1 < ENV['SPACE_X']

    @x = @x + 1
  end

  def move_x_left
    raise SondaMoveNotPermitted unless @x - 1 > 0

    @x = @x - 1
  end

  def move_y_up
    raise SondaMoveNotPermitted unless @y + 1 < ENV['SPACE_Y']

    @y = @y + 1
  end

  def move_y_down
    raise SondaMoveNotPermitted unless @y - 1 > 0

    @y = @y - 1
  end
end
