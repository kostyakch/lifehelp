class AddDeletedAt < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :deleted_at, :datetime
    add_column :client_services, :deleted_at, :datetime
    add_column :performers, :deleted_at, :datetime
    add_column :services, :deleted_at, :datetime
    add_column :users, :deleted_at, :datetime

    add_index :clients, :deleted_at
    add_index :client_services, :deleted_at
    add_index :performers, :deleted_at
    add_index :services, :deleted_at
    add_index :users, :deleted_at
  end
end
