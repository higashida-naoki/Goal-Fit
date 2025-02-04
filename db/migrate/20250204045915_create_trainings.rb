class CreateTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :trainings do |t|
      t.integer :genre_id
      t.string :training_name
      t.string :sample
      t.text :introduction
      t.integer :calories_consumed
      t.timestamps
    end
  end
end
