class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :maker
      t.string :series
      t.string :hard
      t.integer :year 
      t.integer :user_id
      t.timestamps
    end
  end
end
