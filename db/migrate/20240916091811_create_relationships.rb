class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :consumer, null: false, foreigh_key: true
      t.references :producer, null: false, foreigh_key: true
      t.boolean :status, null: false, default: true
      
      t.timestamps
      
      t.index [:consumer_id, :producer_id], unique: true
    end
  end
end
