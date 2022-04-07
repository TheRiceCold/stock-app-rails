class AddDefaultFalseApproved < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :approved, :boolean, default: false
  end
end
