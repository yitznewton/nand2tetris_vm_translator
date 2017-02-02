require_relative 'stack'

class StaticPush
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
    "@#{index.to_i + 16}"
  end

  def index
    command[2]
  end
end
