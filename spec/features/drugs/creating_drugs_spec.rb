require 'rails_helper'

RSpec.feature 'User creating drug' do
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
    visit drugs_path
    click_link 'New Medication'
  end

  scenario 'with valid params' do
    fill_in 'Brand', with: 'Pfizer'
    fill_in 'Name', with: 'Panadol'
    fill_in 'Dose', with: '10mg'
    click_button 'Create Drug'
    expect(page).to have_content 'Medication created successfully'
    expect(page).to have_content 'Pfizer'
    expect(page).to have_content 'Panadol'
    expect(page).to have_content '10mg'
  end

  scenario 'with invalid params' do
    fill_in 'Brand', with: ''
    fill_in 'Name', with: ''
    fill_in 'Dose', with: ''
    click_button 'Create Drug'
    expect(page).to have_content 'Medication not created'
    expect(page).to have_content "Brand can't be blank"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Dose can't be blank"
  end
end
