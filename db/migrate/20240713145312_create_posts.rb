class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :producer, null: false, foreigh_key: true
      t.references :item, null: false, foeigh_key: true
      t.string :title, null: false
      t.text :body
      t.timestamps
    end
  end
end
