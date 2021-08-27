class CreateWorkOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :work_orders do |t|
      t.references :technician, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.date :date
      t.string :time
      t.decimal :duration
      t.integer :price

      t.timestamps
    end
  end
end
