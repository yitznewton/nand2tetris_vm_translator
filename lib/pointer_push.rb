class PointerPush
  POINTER_ADDRESSES = {
    '0' => '@THIS',
    '1' => '@THAT'
  }

  def initialize(command)
    @command = command
  end

  def to_hack
    %Q(
      #{address}
      D=M
      @SP
      M=M+1
      A=M-1
      M=D
    )
  end

  private

  attr_reader :command

  def address
    POINTER_ADDRESSES.fetch(index)
  end

  def index
    command[2]
  end
end
