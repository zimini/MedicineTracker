require 'rails_helper'

RSpec.describe 'Users can create presciptions' do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    visit '/'
    click_link 'My Prescriptions'
    click_link 'New Prescription'
  end

  scenario 'with valid params' do
    fill_in 'Clinic', with: 'Swiss Cottage'
    # fill_in 'Date', with: '2018/01/01'
    click_button 'Create Prescription'
    expect(page).to have_content 'Prescription successfully created'
  end

  scenario 'with invalid params' do
    fill_in 'Clinic', with: ''
    # fill_in 'Date', with: '2018/01/01'
    click_button 'Create Prescription'
    expect(page).to have_content 'Prescription not created'
  end
end
