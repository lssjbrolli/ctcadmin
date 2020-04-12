require 'rails_helper'

RSpec.describe Company, type: :model do
  it "has a valid factory" do
    company = build(:company)
    expect(company).to be_valid
  end
end

# describe Company do
#   it { is_expected.to validate_presence_of(:name) }
# end
