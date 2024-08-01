class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.references :consumer, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end
end
