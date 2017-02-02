module PointerAddress
  POINTER_ADDRESSES = {
    '0' => '@THIS',
    '1' => '@THAT'
  }

  def self.fetch(index)
    POINTER_ADDRESSES.fetch(index)
  end
end
