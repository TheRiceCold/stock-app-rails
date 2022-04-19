require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}
  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end
  it "is not valid without a password" do
    user = User.new(password: nil)
    expect(user).to_not be_valid
  end

  # it "is not unique email" do


  #   first_email = User.create(email: "quevon@gmail.com", password: '123456' , firstname: "quevon", lastname: "galang", )
  #   second_email =  User.create(email: "quevon@gmail.com", password: '123456' , firstname: "quevon", lastname: "galang")
  
  #   expect(second_email).to_not be_valid
  #   expect(second_email.errors).to be_present
  #   expect(second_email.errors.to_hash.keys).to include(:email)
  #   expect(second_email.errors[:email]).to include("has already been taken")
  
  # end
end
