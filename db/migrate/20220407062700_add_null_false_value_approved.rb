class AddNullFalseValueApproved < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :approved, :boolean, null: false
  end
end
