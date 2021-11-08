# frozen_string_literal: true

class Sonda
  attr_reader :x, :y, :direction

  COMMAND_DIRECTION = %w[GE GD].freeze
  DIRECTION_INCREMENT = %w[C D].freeze
  DIRECTION_DECREMENT = %w[B E].freeze
  DIRECTIONS = %w[C D B E].freeze

  def initialize
    start!
  end

  def start!
    @x = 0
    @y = 0
    @direction = 'D'
  end

  def move!
    send("move_#{axis}")
  end

  def change_direction(command)
    raise Exceptions::SondaMoveNotPermitted unless COMMAND_DIRECTION.include? command

    actual_direction = DIRECTIONS.index(@direction)
    @direction = command[-1] == 'E' ? change_direction_left(actual_direction) : change_direction_right(actual_direction)
  end

  def position
    {
      x: @x,
      y: @y,
      face: @direction
    }
  end

  private

  def change_direction_left(actual_direction)
    actual_direction.zero? ? DIRECTIONS[-1] : DIRECTIONS[actual_direction - 1]
  end

  def change_direction_right(actual_direction)
    actual_direction == DIRECTIONS.size - 1 ? DIRECTIONS[0] : DIRECTIONS[actual_direction + 1]
  end

  def axis
    %w[D E].include?(@direction) ? 'x' : 'y'
  end

  def move_x
    @result = direction_increment? ? increment(@x) : decrement(@x)
    validate_position

    @x = @result
  end

  def move_y
    @result = direction_increment? ? increment(@y) : decrement(@y)
    validate_position

    @y = @result
  end

  def validate_position
    raise Exceptions::SondaMoveNotPermitted unless (0..ENV['SPACE_X'].to_i).include?(@result) || (0..ENV['SPACE_Y'].to_i).include?(@result)
  end

  def increment(value)
    value + 1
  end

  def decrement(value)
    value - 1
  end

  def direction_increment?
    DIRECTION_INCREMENT.include? @direction
  end
end
