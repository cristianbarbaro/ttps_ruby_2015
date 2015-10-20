class TrueClass
  def opposite
    false
  end
end

class FalseClass
  def opposite
    true
  end
end


puts false.opposite
puts true.opposite
puts true.opposite.opposite
