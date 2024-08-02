class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :consumer, null: false, foreigh_key: true
      t.references :item, null: false, foreigh_key: true
      t.integer :amount
      t.timestamps
    end
  end
end
