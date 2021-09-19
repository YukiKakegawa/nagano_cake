class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

    t.references :item, null: false
    t.references :order, null: false
    t.integer :price, null: false
    t.integer :amount, null: false
    t.integer :making_status, null: false
    t.datetime :created_at,null: false
    t.datetime :updated_at,null: false

      t.timestamps
    end
  end
end
