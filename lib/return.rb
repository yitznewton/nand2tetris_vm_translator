class Return
  FRAME_LOCATION = '@R5'
  RET_LOCATION   = '@R6'

  def initialize(command)
  end

  def to_hack
    %Q(
      @LCL
      D=M
      #{FRAME_LOCATION}
      M=D
      @5
      A=D-A
      D=M
      #{RET_LOCATION}
      M=D
      #{Pop.new(%w(pop argument 0)).to_hack}

      // restore caller's SP
      @ARG
      D=M+1
      @SP
      M=D

      // restore caller's locations
      #{FRAME_LOCATION}
      A=M-1
      D=M

      @THAT
      M=D

      #{FRAME_LOCATION}
      A=M-1
      A=A-1
      D=M

      @THIS
      M=D

      #{FRAME_LOCATION}
      A=M-1
      A=A-1
      A=A-1
      D=M

      @ARG
      M=D

      #{FRAME_LOCATION}
      A=M-1
      A=A-1
      A=A-1
      A=A-1
      D=M

      @LCL
      M=D

      #{RET_LOCATION}
      A=M
      0;JMP
    )
  end
end
