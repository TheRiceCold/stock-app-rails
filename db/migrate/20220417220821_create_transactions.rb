class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :transaction_type, null: false, default: 0
      t.integer :stocks, null: false
      t.decimal :total_cost, null: false
      t.belongs_to :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
