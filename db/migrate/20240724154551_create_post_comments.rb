class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.references :consumer, null: false, foreigh_key: true
      t.references :post, null: false, foreigh_key: true
      t.text :content, null: false
      t.timestamps
    end
  end
end
