class Function
  def initialize(command)
    @command = command
  end

  def to_hack
    label_entry + initialize_locals
  end

  private

  def label_entry
    %Q(
      (#{name}.ENTRY)
    )
  end

  def initialize_locals
    Push.new(%w(push constant 0)).to_hack * local_count
  end

  attr_reader :command

  def name
    command[1]
  end
  
  def local_count
    command[2].to_i
  end
end
