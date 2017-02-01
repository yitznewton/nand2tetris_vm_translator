class Line
  def initialize(line)
    @line = line
  end

  def command
    @command ||= decommented.strip
  end

  def empty?
    command.empty?
  end

  private

  attr_reader :line

  def decommented
    finish = line.index('//') || -1
    line[0...finish]
  end
end
