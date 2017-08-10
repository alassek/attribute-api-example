class AddAddressType < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
      CREATE TYPE address AS (
        street  text,
        city    text,
        state   varchar(2),
        zipcode varchar(9)
      )
    SQL
  end

  def down
    execute "DROP TYPE address"
  end
end
