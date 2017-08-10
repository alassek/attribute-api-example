class AddressType < ActiveRecord::Type::Text
  def type
    :address
  end

  def serialize(value)
    return if value.nil?
    return value if value.is_a? String
    %{("#{value.street}","#{value.city}","#{value.state}","#{value.zipcode}")}
  end

  def deserialize(value)
    return if value.nil?
    attrs = value.to_s[1..-2].split(',', 4).map{|v| cleanup(v) }
    Address.new Hash[%i[street city state zipcode].zip(attrs)]
  end

  def cast(value)
    return if value.nil?
    return value if value.is_a? Address

    attrs = if Hash === value
      value.symbolize_keys
    else
      {}
    end

    Address.new(**attrs)
  end

  def changed_in_place?(raw_old_value, new_value)
    if new_value.is_a?(Address)
      deserialize(raw_old_value) != new_value
    end
  end

  private

  def cleanup(value)
    cleaned = value.to_s.gsub('"', '')
    cleaned.present? ? cleaned : nil
  end
end
