require 'rails_helper'

RSpec.describe "models/show", type: :view do
  before(:each) do
    @model = assign(:model, Model.create!(
      :User => "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
  end
end
