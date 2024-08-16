class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreigh_key: true
      t.references :item, null: false, foreigh_key: true
      t.integer :price, null: false
      t.integer :amount, null: false
      t.integer :status, default: 0, null: false
      t.timestamps
    end
  end
end
