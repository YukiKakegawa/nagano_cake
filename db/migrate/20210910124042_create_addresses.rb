class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

    t.references :customer, null: false
    t.string :name, null: false
    t.string :postal_code, null: false
    t.string :address, null: false
    t.datetime :created_at,null: false
    t.datetime :updated_at,null: false

      t.timestamps
    end
  end
end
