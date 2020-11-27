class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id,      null: false
      t.integer :customer_id,      null: false
      t.integer :purchase_price,      null: false
      t.integer :amount,      null: false

      t.timestamps
    end
  end
end
