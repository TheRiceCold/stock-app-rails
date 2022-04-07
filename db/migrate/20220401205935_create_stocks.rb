class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.string :logo_url
      t.string :company_name
      t.decimal :latest_price, precision: 15, scale: 2
      t.integer :quantity
      t.decimal :market_cap, precision: 15, scale: 2

      t.timestamps
    end
  end
end
