class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.references :property, null: false, foreign_key: true
      t.integer :price
      t.references :accepted_by, null: true, foreign_key: {to_table: :companies}

      t.timestamps
    end
  end
end
