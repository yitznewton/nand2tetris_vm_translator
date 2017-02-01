require 'securerandom'

class Compare
  MAP = {
    'eq' => 'JEQ',
    'gt' => 'JGT',
    'lt' => 'JLT'
  }

  def initialize(command)
    @command = command
    @label_index = SecureRandom.hex(8)
  end

  def to_hack
    %Q(
      @SP
      AM=M-1
      D=M
      @SP
      A=M-1
      D=M-D
      @#{label_index}.TRUE
      D;#{comparison}
      // else
      D=0
      @#{label_index}.CONTINUE
      0;JMP
      (#{label_index}.TRUE)
      D=-1
      (#{label_index}.CONTINUE)
      @SP
      A=M-1
      M=D
    )
  end

  private

  attr_reader :command, :label_index

  def comparison
    MAP.fetch(command)
  end
end
