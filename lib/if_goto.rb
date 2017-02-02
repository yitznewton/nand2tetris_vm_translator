class IfGoto
  def initialize(command)
    @command = command
  end

  def to_hack
    Stack.pop_value_to_d + conditional_jump
  end

  private

  attr_reader :command

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
