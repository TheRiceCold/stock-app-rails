require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        transaction_type: 2,
        stocks: 3,
        total_cost: "9.99",
        user: nil,
        company: nil
      ),
      Transaction.create!(
        transaction_type: 2,
        stocks: 3,
        total_cost: "9.99",
        user: nil,
        company: nil
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
