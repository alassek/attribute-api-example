ActiveRecord::Type.register :address, AddressType
ActiveRecord::Type.register :encrypted, EncryptedType

ActiveRecord::Base.connection.type_map.alias_type 'address', 'text'
