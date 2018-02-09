require 'rails_helper'

RSpec.feature 'Can update diary' do
  let!(:diary) { FactoryBot.create(:diary) }

  before do
    visit '/'
    click_link 'Diary 1'
    click_link 'Edit'
  end

  scenario 'with valid params' do
    fill_in 'Title', with: ''
    fill_in 'Description', with: ''
    click_button 'Update Diary'
    expect(page).to have_content 'Diary was not updated'
    expect(page).to have_content "Title can't be blank"
  end
end
