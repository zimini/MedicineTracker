require 'rails_helper'

RSpec.feature 'Signed in users can sign out' do
  let!(:user) { FactoryBot.create(:user) }
  scenario do
    login_as(user)
    visit '/'
    click_link 'Sign out'
    expect(page).to have_content "Signed out successfully."
  end
end
