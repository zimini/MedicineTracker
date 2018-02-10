require 'rails_helper'

RSpec.feature 'Can delete diary' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:diary) { FactoryBot.create(:diary, user: user) }

  scenario 'successfully' do
    login_as(user)
    visit '/'
    click_link 'My Diaries'
    click_link 'Diary 1'
    click_link 'Delete'
    expect(page).to have_content 'Diary successfully deleted'
  end
end
