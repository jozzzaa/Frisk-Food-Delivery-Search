class CreateFoodTags < ActiveRecord::Migration[5.0]
  def change
    create_table :food_tags do |t|
      t.integer :food_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
