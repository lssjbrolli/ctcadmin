require 'rails_helper'

RSpec.describe Bonus, type: :model do
  it "has a valid factory" do
    bonus = build(:bonus)
    expect(bonus).to be_valid
  end
end