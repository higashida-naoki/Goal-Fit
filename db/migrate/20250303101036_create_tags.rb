class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :post_id
      t.integer :image_type
      t.timestamps
    end
  end
end