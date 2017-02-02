require_relative 'memory_address'
require_relative 'stack'

class Push
  def initialize(command)
    @command = command
  end

  def to_hack
    put_value_in_d + Stack.push_d
  end

  private

  attr_reader :command

  def put_value_in_d
    if constant?
      %Q(
        @#{constant}
        D=A
      )
    else
      %Q(
        #{put_source_in_a}
        D=M
      )
    end
  end

  def put_source_in_a
    MemoryAddress.new(memory_segment, index).to_hack('A')
  end

  def constant?
    command[1] == 'constant'
  end

  def memory_segment
    command[1]
  end

  def constant
    command[2]
  end

  def index
    command[2]
  end
end
