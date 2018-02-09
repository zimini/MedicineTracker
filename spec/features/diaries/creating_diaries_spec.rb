require 'rails_helper'

RSpec.feature 'Can create diaries' do
  before do
    visit '/'
    click_link 'New Diary'
  end

  scenario 'with valid params' do
    fill_in 'Title', with: 'Diary 1'
    fill_in 'Description', with: 'Diary 1 description'
    click_button 'Create Diary'
    expect(page).to have_content 'Diary successfully created'
    expect(page).to have_content 'Diary 1'
    expect(page).to have_content 'Diary 1 description'
  end

  scenario 'with invalid params' do
    fill_in 'Title', with: ''
    fill_in 'Description', with: ''
    click_button 'Create Diary'
    expect(page).to have_content 'Diary was not created'
    expect(page).to_not have_content 'Diary 1'
    expect(page).to have_content "Title can't be blank"
  end
end
