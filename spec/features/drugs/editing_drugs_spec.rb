require 'rails_helper'

RSpec.feature 'User can edit drug' do
  let(:user) { FactoryBot.create(:user) }
  let!(:drug) { FactoryBot.create(:drug, user: user) }

  before do
    login_as(user)
    visit drugs_path
    click_link 'Edit'
  end

  scenario 'with valid params' do
    fill_in 'Brand', with: 'GSK'
    fill_in 'Name', with: 'Aspirin'
    fill_in 'Dose', with: '20mg'
    click_button 'Update Drug'
    expect(page).to have_content 'Medication updated successfully'
    expect(page).to have_content 'GSK'
    expect(page).to have_content 'Aspirin'
    expect(page).to have_content '20mg'
  end

  scenario 'with invalid params' do
    fill_in 'Brand', with: ''
    fill_in 'Name', with: ''
    fill_in 'Dose', with: ''
    click_button 'Update Drug'
    expect(page).to have_content 'Medication not updated'
    expect(page).to have_content "Brand can't be blank"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Dose can't be blank"
  end
end
