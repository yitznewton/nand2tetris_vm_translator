class Push
  def initialize(command)
    @command = command
  end

  def to_hack
    put_value_in_d + %Q(
      @SP
      M=M+1
      A=M-1
      M=D
    )
  end

  private

  attr_reader :command

  def put_value_in_d
    %Q(
      @#{constant}
      D=A
    )
  end

  def constant
    command[14..-1]
  end
end
