class CreateServices < ActiveRecord::Migration[6.0]
  def change
    create_table :services, id: :uuid, default: -> { 'uuid_generate_v4()' } do |t|
      t.string :title, null: false
      t.integer :quantity
      t.string :description

      t.timestamps
    end
  end
end
