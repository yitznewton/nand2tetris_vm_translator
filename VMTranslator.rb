require_relative 'lib/command'
require_relative 'lib/line'

def each_line
  File.foreach(ARGV[0]) do |line|
    yield Line.new(line)
  end
end

each_line do |line|
  next if line.empty?

  puts Command.parse(line.command).to_hack
end

puts %Q(
(END)
@END
0;JMP
)
