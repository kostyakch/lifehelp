require 'rails_helper'

RSpec.describe "performers/new", type: :view do
  before(:each) do
    assign(:performer, Performer.new())
  end

  it "renders new performer form" do
    render

    assert_select "form[action=?][method=?]", performers_path, "post" do
    end
  end
end
