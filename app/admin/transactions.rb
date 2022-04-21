ActiveAdmin.register Transaction do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :transaction_type, :price, :stocks, :user_id, :company_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:transaction_type, :price, :stocks, :user_id, :company_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :transaction_type
    column :price
    column :stocks
    column :user_id
    column :company_id
    column :updated_at

end
end
