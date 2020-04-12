# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CompaniesController, type: :controller do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'create new company' do
        create(:company, { created_by: 1, updated_by: 1 })
        expect(Company.count).to eq(1)
      end
    end
    context 'with invalid attributes' do
      it 'does not create a new company' do
        create(:company)
        expect(Company.count).to eq(0)
      end
    end
  end
end
