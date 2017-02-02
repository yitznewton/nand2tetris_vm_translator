class Arithmetic
  SIGNS = {
    'add' => '+',
    'sub' => '-',
    'and' => '&',
    'or' => '|'
  }

  def initialize(command)
    @command = command
  end

  def to_hack
    %Q(
      #{Stack.pop_value_to_d}
      @SP
      A=M-1
      M=M#{sign}D
    )
  end

  private

  attr_reader :command

  def sign
    SIGNS.fetch(command[0])
  end
end
