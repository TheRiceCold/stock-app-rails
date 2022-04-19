require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      transaction_type: 1,
      stocks: 1,
      total_cost: "9.99",
      user: nil,
      company: nil
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input[name=?]", "transaction[transaction_type]"

      assert_select "input[name=?]", "transaction[stocks]"

      assert_select "input[name=?]", "transaction[total_cost]"

      assert_select "input[name=?]", "transaction[user_id]"

      assert_select "input[name=?]", "transaction[company_id]"
    end
  end
end
