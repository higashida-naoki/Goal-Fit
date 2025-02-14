class AddCategoryAndTargetBodyPartToExercises < ActiveRecord::Migration[6.1]
  def change
    add_column :exercises, :category, :string
    add_column :exercises, :target_body_part, :string
  end
end
