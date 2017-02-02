require_relative 'stack'

class StaticPop
  def initialize(command)
    @command = command
  end

  def to_hack
    Stack.pop_value_to_address(address)
  end

  private

  attr_reader :command

  def address
    "@#{index.to_i + 16}"
  end

  def index
    command[2]
  end
end
