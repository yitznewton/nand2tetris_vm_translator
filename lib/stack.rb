module Stack
  def self.pop_value_to_address(address)
    %Q(
      #{pop_value_to_d}
      #{address}
      M=D
    )
  end

  def self.push_address(address)
    %Q(
      #{address}
      D=M
      #{push_d}
    )
  end

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
