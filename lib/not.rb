class Not
  def initialize(command)
  end

  def to_hack
    %Q(
      @SP
      A=M-1
      M=!M
    )
  end
end
