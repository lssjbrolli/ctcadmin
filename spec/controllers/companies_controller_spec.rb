require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do

  describe "POST #create" do
    context "with valid attributes" do
      it "create new company" do
        post :create, company: attributes_for(:company)
        expect(Company.count).to eq(1)
      end
    end
    context "with invalid attributes" do
      it "does not create a new company" do
        post :create, company: attributes_for(:company)
        expect(Company.count).to eq(0)
      end
    end
  end
end

