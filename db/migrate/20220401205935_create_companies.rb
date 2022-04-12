class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :ticker
      t.string :name
      t.string :logo_url
      t.integer :stocks
      t.json :prices
      t.decimal :market_cap

      t.timestamps
    end
  end
end
