class Label
  def initialize(command)
    @command = command
  end

  def to_hack
    %Q(
      (#{scope}.#{label})
    )
  end

  private

  attr_reader :command

  def scope
    'LOLdunno'
  end

  def label
    words[1]
  end

  def words
    command.split(' ')
  end
end
