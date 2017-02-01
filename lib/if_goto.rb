class IfGoto
  def initialize(command)
    @command = command
  end

  def to_hack
    put_value_in_d + conditional_jump
  end

  private

  attr_reader :command

  def put_value_in_d
    %Q(
      @SP
      AM=M-1
      D=M
    )
  end

  def conditional_jump
    %Q(
      @#{scope}.#{label}
      D;JNE
    )
  end

  def scope
    'LOLdunno'
  end

  def label
    command[1]
  end
end
