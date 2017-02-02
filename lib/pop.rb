require_relative 'memory_address'
require_relative 'stack'

class Pop
  LOCATION_OF_CACHE = '@R13'

  def initialize(command)
    @command = command
  end

  def to_hack
    cache_destination + Stack.pop_value_to_d + save
  end

  private

  attr_reader :command

  def cache_destination
    %Q(
      #{put_destination_in_d}
      #{LOCATION_OF_CACHE}
      M=D
    )
  end

  def put_destination_in_d
    MemoryAddress.new(memory_segment, index).to_hack('D')
  end

  def save
    %Q(
      #{LOCATION_OF_CACHE}
      A=M
      M=D
    )
  end

  def memory_segment
    command[1]
  end

  def index
    command[2]
  end
end
