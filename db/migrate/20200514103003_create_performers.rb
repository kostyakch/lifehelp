class CreatePerformers < ActiveRecord::Migration[6.0]
  def change
    create_table :performers, id: :uuid, default: -> { 'uuid_generate_v4()' } do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.integer :performer_type, null: false, default: 0

      t.string :phone, null: false
      t.string :email
      t.string :address
      t.string :description

      t.timestamps
    end
  end
end
