class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.references :street, null: false, foreign_key: true
      t.references :company, null: true, foreign_key: true
      t.string :number
      t.string :type
      t.datetime :constructed_at

      t.timestamps
    end
  end
end
