require_relative 'pointer_address'
require_relative 'stack'

class PointerPop
  def initialize(command)
    @command = command
  end

  def to_hack
    %Q(
      #{Stack.pop_value_to_d}
      #{address}
      M=D
    )
  end

  private

  attr_reader :command

  def address
    PointerAddress.fetch(index)
  end

  def index
    command[2]
  end
end
