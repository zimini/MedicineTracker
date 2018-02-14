require 'rails_helper'

RSpec.feature 'Users can delete prescription' do
  let(:user) { FactoryBot.create(:user) }
  let!(:prescription1) { FactoryBot.create(:prescription, user: user) }

  scenario 'successfully' do
    login_as(user)
    visit '/'
    click_link 'My Prescriptions'
    click_link 'Edit'
    click_link 'Delete Prescription'

    expect(page).to have_content 'Prescription deleted'
  end

end
