class Address < Struct.new(:street, :city, :state, :zipcode)
  def initialize(**attrs)
    super *attrs.values_at(:street, :city, :state, :zipcode)
  end

  def ==(other)
    other.is_a?(Address) && hash == other.hash
  end

  def hash
    [Address, street, city, state, zipcode].hash
  end

  def to_s
    "#{street}, #{city}, #{state} #{zipcode}"
  end
end
