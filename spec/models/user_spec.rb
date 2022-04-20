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
  


  context "validations" do

  end

end
