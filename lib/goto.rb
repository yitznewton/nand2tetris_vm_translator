class Goto
  def initialize(command)
    @command = command
  end

  def to_hack
    %Q(
      @#{label}
      0;JMP
    )
  end

  private

  attr_reader :command

  def label
    command[1]
  end
end
