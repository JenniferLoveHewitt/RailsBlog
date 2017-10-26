require "rails_helper"

RSpec.describe Article do
  it "do something" do
    article1 = FactoryGirl.create(:article)
    expect(article1.id).to eq(100)
  end
end