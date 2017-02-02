require_relative 'lib/command'
require_relative 'lib/line'

def each_line
  files.each do |f|
    File.foreach(f) do |line|
      yield Line.new(line)
    end
  end
end

def files
  Dir.glob(File.join(ARGV[0], '*.vm'))
end

each_line do |line|
  next if line.empty?

  puts "// #{line.command}"
  puts Command.parse(line.command).to_hack
end

puts %Q(
(END)
@END
0;JMP
)
