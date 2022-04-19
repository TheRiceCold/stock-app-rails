require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      transaction_type: 1,
      stocks: 1,
      total_cost: "9.99",
      user: nil,
      company: nil
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input[name=?]", "transaction[transaction_type]"

      assert_select "input[name=?]", "transaction[stocks]"

      assert_select "input[name=?]", "transaction[total_cost]"

      assert_select "input[name=?]", "transaction[user_id]"

      assert_select "input[name=?]", "transaction[company_id]"
    end
  end
end
