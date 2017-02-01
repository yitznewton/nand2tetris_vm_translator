class MemoryAddress
  MEMORY_SEGMENTS = {
    'local' => '@LCL',
    'argument' => '@ARG'
  }

  def initialize(segment, index)
    @segment = segment
    @index = index
  end

  def to_hack(destination_register)
    %Q(
      #{starting_location}
      D=M
      @#{index}
      #{destination_register}=A+D
    )
  end

  private

  attr_reader :segment, :index

  def starting_location
    MEMORY_SEGMENTS.fetch(segment)
  end
end
