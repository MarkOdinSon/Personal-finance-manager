class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      # Only expense
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.datetime :odate, null: false
      t.string :description, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
