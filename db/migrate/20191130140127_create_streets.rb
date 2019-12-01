class CreateStreets < ActiveRecord::Migration[6.0]
  def change
    create_table :streets do |t|
      t.references :city, null: false, foreign_key: true
      t.string :name
      t.integer :appeal

      t.timestamps
    end
  end
end
