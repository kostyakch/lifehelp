require 'rails_helper'

RSpec.describe "performers/index", type: :view do
  before(:each) do
    assign(:performers, [
      Performer.create!(),
      Performer.create!()
    ])
  end

  it "renders a list of performers" do
    render
  end
end
