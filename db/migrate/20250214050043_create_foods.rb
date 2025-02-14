class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :calories
      t.string :category

      t.timestamps
    end
  end
end
