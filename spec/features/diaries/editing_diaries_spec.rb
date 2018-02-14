require 'rails_helper'

RSpec.feature 'Can update diary' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:diary) { FactoryBot.create(:diary, user: user) }
  let!(:prescription) { FactoryBot.create(:prescription, user: user) }

  before do
    login_as(user)
    visit '/'
    click_link 'My Diaries'
    click_link 'Edit'
  end

  context 'without a prescription' do
    scenario 'with valid params' do
      fill_in 'Title', with: 'Diary 2'
      fill_in 'Description', with: 'Diary 2 description'
      click_button 'Update Diary'
      expect(page).to have_content 'Diary updated successfully'
      expect(page).to have_content "Diary 2"
    end

    scenario 'with invalid params' do
      fill_in 'Title', with: ''
      fill_in 'Description', with: ''
      click_button 'Update Diary'
      expect(page).to have_content 'Diary was not updated'
      expect(page).to have_content "Title can't be blank"
    end
  end

  context 'with a prescription' do
    scenario 'with valid params' do
      fill_in 'Title', with: 'Diary 2'
      fill_in 'Description', with: 'Diary 2 description'
      select 'Swiss Cottage', from: 'diary_prescription'
      click_button 'Update Diary'
      expect(page).to have_content 'Diary updated successfully'
      expect(page).to have_content "Diary 2"
    end

    scenario 'with invalid params' do
      fill_in 'Title', with: ''
      fill_in 'Description', with: ''
      click_button 'Update Diary'
      expect(page).to have_content 'Diary was not updated'
      expect(page).to have_content "Title can't be blank"
    end
  end

end
