class Goto
  def initialize(command)
    @command = command
  end

  def to_hack
    %Q(
      @#{scope}.#{label}
      0;JMP
    )
  end

  private

  attr_reader :command

  def scope
    'LOLdunno'
  end

  def label
    command[1]
  end
end
