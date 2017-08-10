class EncryptedType < ActiveRecord::Type::Text
  def type
    :encrypted
  end

  def serialize(value)
    return if value.nil?
    Base64.encode64(public_key.public_encrypt(cast value))
  end

  def deserialize(value)
    return if value.nil?
    private_key.private_decrypt(Base64.decode64(cast value))
  end

  private

  def public_key
    @public ||= OpenSSL::PKey::RSA.new(Rails.application.secrets.public_key)
  end

  def private_key
    @private ||= OpenSSL::PKey::RSA.new(Rails.application.secrets.private_key)
  end
end
