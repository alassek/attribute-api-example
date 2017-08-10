class AddAddressToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_column :companies, :hq, :address
  end
end
