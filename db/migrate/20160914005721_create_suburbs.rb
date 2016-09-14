class CreateSuburbs < ActiveRecord::Migration[5.0]
  def change
    create_table :suburbs do |t|
      t.string :suburb
      t.integer :postcode

      t.timestamps
    end
  end
end
