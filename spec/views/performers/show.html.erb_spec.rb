require 'rails_helper'

RSpec.describe "performers/show", type: :view do
  before(:each) do
    @performer = assign(:performer, Performer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
