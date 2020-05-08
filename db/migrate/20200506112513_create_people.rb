class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.string :phone
      t.date :dob
      t.string :city
      t.string :address
      t.string :area
      t.string :description

      t.integer :code, null: false, default: 0
      t.integer :objectivity, null: false, default: 0
      t.integer :marital_status, null: false, default: 0
      t.integer :social_status, null: false, default: 0
      t.integer :source, null: false, default: 0

      t.timestamps
    end
  end
end
