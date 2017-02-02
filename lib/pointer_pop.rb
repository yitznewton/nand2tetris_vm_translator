require_relative 'pointer_address'
require_relative 'stack'

class PointerPop
  def initialize(command)
    @command = command
  end

  def to_hack
    Stack.pop_value_to_address(address)
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
