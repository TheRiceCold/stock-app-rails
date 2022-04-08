class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type, null: false, default: 0
      t.integer :quantity, null: false, default: 1
      t.decimal :total_cost, precision: 15, scale: 2, null: false
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
