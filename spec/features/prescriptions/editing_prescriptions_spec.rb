require 'rails_helper'

RSpec.feature 'Users can edit prescriptions' do
  let(:user) { FactoryBot.create(:user) }
  let!(:prescription) { FactoryBot.create(:prescription, user: user)}
  before do
    login_as(user)
    visit '/'
    click_link 'My Prescriptions'
    click_link 'Swiss Cottage'
    click_link 'Edit'
  end

  scenario 'with valid attributes' do
    fill_in 'Clinic', with: 'West Hampstead'
    click_button 'Update Prescription'
    expect(page).to have_content 'Prescription updated successfully'
    expect(page).to have_content 'West Hampstead'
  end
end
