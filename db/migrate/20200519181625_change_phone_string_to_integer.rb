class ChangePhoneStringToInteger < ActiveRecord::Migration[6.0]
  def up
    change_column :clients, :phone, 'bigint USING CAST(phone AS bigint)'
    change_column :performers, :phone, 'bigint USING CAST(phone AS bigint)'
    change_column :users, :phone, 'bigint USING CAST(phone AS bigint)'
  end

  def down
    change_column :clients, :phone, :string
    change_column :performers, :phone, :string
    change_column :users, :phone, :string
  end
end
