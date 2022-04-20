ActiveAdmin.register User do
  permit_params :email, :password,:password_confirmation,:encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :balance, :status, :approved, :confirmation_token,:confirmed_at,:confirmation_sent_at,:unconfirmed_email

  before_action :remove_password_params_if_blank, only: [:update]
  controller do

    def remove_password_params_if_blank
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete(:password)
        params[:user].delete(:password_confirmation)
      end
    end
  end
  filter :email
  filter :approved

  form do |f|
    f.inputs do
        if f.object.new_record?
            f.input :email
            f.input :firstname
            f.input :lastname
            f.input :password
            f.input :password_confirmation
        else
            f.input :email
            f.input :firstname
            f.input :lastname
        end
    end
    f.submit
  end 
 index do
        selectable_column
        id_column
        column :email
        column :created_at
        column :firstname
        column :lastname
        column :wallet
        column :approved?
        column "Status" do |user|
          if user.approved == false
            link_to 'Inactive', active_user_path(user), method: :patch, data: {confirm: "Do you want to activate #{user.firstname}?"},:class => 'link', style: "color: red;"
          else 
            link_to 'Active', inactive_user_path(user), method: :patch, data: {confirm: "Do you want to deactivate #{user.firstname}?"},:class => 'link', style: "color: green;"
          end
        end
        actions
  
  end


  show do
    attributes_table do
      row :email
      row :firstname
      row :lastname
      row :approved?
      row :wallet
    end
  end





  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #

  
#   or
  
#   permit_params do
#     permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :balance, :status, :approved]
#     permitted << :other if params[:action] == 'create user' && current_user.admin?
#     permitted
# end

  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :balance, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :balance, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

end
