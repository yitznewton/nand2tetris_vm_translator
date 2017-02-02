require_relative 'stack'

class StaticPush
  def initialize(command)
    @command = command
  end

  def to_hack
    Stack.push_address(address)
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
