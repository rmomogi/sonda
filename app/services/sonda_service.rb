# frozen_string_literal: true

class SondaService
  include Singleton

  def initialize
    @sonda = Sonda.new
  end

  def reset
    @sonda.start!
  end

  def execute(sonda)
    sonda['movimentos'].each do |command|
      Sonda::COMMAND_DIRECTION.include?(command) ? @sonda.change_direction(command) : @sonda.move!
    end
  end

  def position
    @sonda.position
  end
end
