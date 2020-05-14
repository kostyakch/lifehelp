require 'rails_helper'

RSpec.describe "performers/edit", type: :view do
  before(:each) do
    @performer = assign(:performer, Performer.create!())
  end

  it "renders the edit performer form" do
    render

    assert_select "form[action=?][method=?]", performer_path(@performer), "post" do
    end
  end
end
