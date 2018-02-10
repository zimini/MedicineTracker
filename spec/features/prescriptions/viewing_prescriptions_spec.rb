require 'rails_helper'

RSpec.feature 'Users can view' do
  let(:user) { FactoryBot.create(:user) }
  let!(:prescription1) { FactoryBot.create(:prescription, user: user) }
  let!(:prescription2) { FactoryBot.create(:prescription, user: user, clinic: 'West Hampstead') }

  before do
    login_as(user)
    visit '/'
    click_link 'My Prescriptions'
  end

  scenario 'all their prescriptions' do
    expect(page).to have_content prescription1.clinic
    expect(page).to have_content prescription2.clinic
  end

  scenario 'specific prescription details' do
    click_link 'Swiss Cottage'
    expect(page).to have_content prescription1.clinic
    expect(page).to have_content user.email
  end
end
