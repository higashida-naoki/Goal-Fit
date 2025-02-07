class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :breakfast
      t.string :lunch
      t.string :dinner
      t.string :dessert
      t.integer :calories_consumed
      t.integer :calorie_intake
      t.integer :total_calories
      t.integer :progress
      t.integer :weight
      t.string :body
      t.text :effort_point
      t.timestamps
    end
  end
end
