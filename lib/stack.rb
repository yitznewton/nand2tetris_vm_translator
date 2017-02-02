module Stack
  def self.pop_value_to_d
    %Q(
      @SP
      AM=M-1
      D=M
    )
  end

  def self.push_d
    %Q(
      @SP
      M=M+1
      A=M-1
      M=D
    )
  end
end
