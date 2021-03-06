class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      t.integer :game_id
      t.integer :user_id
      t.datetime :date
      t.text :text
      t.integer :likes_count
      t.timestamps
    end
  end
end
