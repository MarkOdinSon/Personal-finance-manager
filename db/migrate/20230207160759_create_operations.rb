class CreateOperations < ActiveRecord::Migration[7.0]
  def change
    create_table :operations do |t|
      t.string :otype
      t.decimal :amount
      t.datetime :odate
      t.string :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
