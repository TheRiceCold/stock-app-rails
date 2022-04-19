require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it "is not valid without a email" do
    admin = AdminUser.new(email: nil)
    expect(admin).to_not be_valid
  end
  it "is not valid without a password" do
    admin = AdminUser.new(password: nil)
    expect(admin).to_not be_valid
  end
end

