class CreateFoodSuburbs < ActiveRecord::Migration[5.0]
  def change
    create_table :food_suburbs do |t|
      t.integer :food_id
      t.integer :suburb_id

      t.timestamps
    end
  end
end
