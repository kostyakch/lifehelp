class CreateClientServices < ActiveRecord::Migration[6.0]
  def change
    create_table :client_services, id: :uuid, default: -> { 'uuid_generate_v4()' } do |t|
      t.belongs_to :client, foreign_key: true, index: true, null: false
      t.belongs_to :service, type: :uuid, foreign_key: true, index: true, null: false

      t.integer :status, null: false, default: 0
      t.timestamp :started_at, null: false
      t.timestamp :finished_at

      t.timestamps
    end
  end
end
