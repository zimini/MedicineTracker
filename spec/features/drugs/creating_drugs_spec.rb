require 'rails_helper'

RSpec.feature 'User can create drug' do
  let(:user) { FactoryBot.create(:user) }
  let(:prescription) { FactoryBot.create(:prescription, user: user) }

  before do
    login_as(user)
    visit prescription_path(prescription)
    click_link 'New Drug'
  end

  scenario 'with valid params' do
    fill_in 'Brand', with: 'Pfizer'
    fill_in 'Name', with: 'Panadol'
    fill_in 'Dose', with: '10mg'
    click_button 'Create Drug'
    expect(page).to have_content 'Drug created successfully'
    expect(page).to have_content 'Pfizer'
    expect(page).to have_content 'Panadol'
    expect(page).to have_content '10mg'
  end

  scenario 'with invalid params' do
    fill_in 'Brand', with: ''
    fill_in 'Name', with: ''
    fill_in 'Dose', with: ''
    click_button 'Create Drug'
    expect(page).to have_content 'Drug not created'
    expect(page).to have_content "Brand can't be blank"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Dose can't be blank"
  end
end
