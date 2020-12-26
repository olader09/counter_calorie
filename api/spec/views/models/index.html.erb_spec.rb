require 'rails_helper'

RSpec.describe "models/index", type: :view do
  before(:each) do
    assign(:models, [
      Model.create!(
        :User => "User"
      ),
      Model.create!(
        :User => "User"
      )
    ])
  end

  it "renders a list of models" do
    render
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
