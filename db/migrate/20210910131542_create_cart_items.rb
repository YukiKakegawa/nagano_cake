class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|

    t.references :item, null: false
    t.references :customer, null: false
    t.integer :amount, null: false
    t.datetime :created_at,null: false
    t.datetime :updated_at,null: false

      t.timestamps
    end
  end
end
