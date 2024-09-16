class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :follower, null: false, foreigh_key: true
      t.references :followed, null: false, foreigh_key: true
      t.boolean :status, null: false, default: true
      t.timestamps
    end
  end
end
