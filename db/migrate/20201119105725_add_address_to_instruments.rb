class AddAddressToInstruments < ActiveRecord::Migration[6.0]
  def change
    add_column :instruments, :address, :string
  end
end
