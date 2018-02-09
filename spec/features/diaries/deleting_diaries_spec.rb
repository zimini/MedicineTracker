require 'rails_helper'

RSpec.feature 'Can delete diary' do
  scenario 'successfully' do
    FactoryBot.create(:diary)
    visit '/'
    click_link 'Diary 1'
    click_link 'Delete'
    expect(page).to have_content 'Diary successfully deleted'
  end
end
