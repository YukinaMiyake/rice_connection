class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :producer, null: false, foreigh_key: true
      t.string :name, null: false
      t.text :introduction
      t.integer :price, null: false, default: 0
      t.integer :stock, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
