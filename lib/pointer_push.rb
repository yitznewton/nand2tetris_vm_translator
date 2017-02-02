require_relative 'pointer_address'

class PointerPush
  def initialize(command)
    @command = command
  end

  def to_hack
    %Q(
      #{address}
      D=M
      #{Stack.push_d}
    )
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
