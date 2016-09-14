class CreateFoods < ActiveRecord::Migration[5.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.text :image_url
      t.text :address_street
      t.text :address_suburb
      t.string :provider

      t.timestamps
    end
  end
end
