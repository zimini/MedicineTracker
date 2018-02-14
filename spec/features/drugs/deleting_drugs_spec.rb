require 'rails_helper'

RSpec.feature 'User can delete drugs' do
  let(:user) { FactoryBot.create(:user) }
  let!(:drug) { FactoryBot.create(:drug, user: user) }

  scenario 'successfully' do
    login_as(user)
    visit '/'
    click_link 'Medications'
    click_link 'Edit'
    click_link 'Delete Medication'

    expect(page).to have_content 'Medication deleted'
  end
end
