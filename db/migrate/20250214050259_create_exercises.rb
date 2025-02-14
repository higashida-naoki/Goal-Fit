class CreateExercises < ActiveRecord::Migration[6.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :calories
      t.string :category
      t.string :target_body_part
      t.timestamps
    end
  end
end
