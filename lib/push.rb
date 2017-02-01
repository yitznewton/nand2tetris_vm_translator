require_relative 'memory_address'

class Push
  def initialize(command)
    @command = command
  end

  def to_hack
    put_value_in_d + put_d_on_stack
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

  def put_d_on_stack
    %Q(
      @SP
      M=M+1
      A=M-1
      M=D
    )
  end

  def put_source_in_a
    MemoryAddress.new(memory_segment, index).to_hack('A')
  end

  def constant?
    words[1] == 'constant'
  end

  def memory_segment
    words[1]
  end

  def constant
    words[2]
  end

  def index
    words[2]
  end

  def words
    command.split(' ')
  end
end
