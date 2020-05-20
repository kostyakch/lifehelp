class ClientsUniques < ActiveRecord::Migration[6.0]
  def change
    add_index :clients, %i[first_name last_name dob], unique: true
    add_index :clients, :phone, unique: true
  end
end
