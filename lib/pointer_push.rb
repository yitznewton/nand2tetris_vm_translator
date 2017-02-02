require_relative 'pointer_address'
require_relative 'stack'

class PointerPush
  def initialize(command)
    @command = command
  end

  def to_hack
    Stack.push_address(address)
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
