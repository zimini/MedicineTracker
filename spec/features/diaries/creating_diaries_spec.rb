require 'rails_helper'

RSpec.feature 'Can create diaries' do

  let(:user) { FactoryBot.create(:user) }
  let!(:prescription) { FactoryBot.create(:prescription, user: user) }

  before do
    login_as(user)
    visit '/'
    click_link 'My Diaries'
    click_link 'New Diary'
  end

  context 'without a prescription' do
    scenario 'with valid params' do
      fill_in 'Title', with: 'Diary 1'
      fill_in 'Description', with: 'Diary 1 description'
      click_button 'Create Diary'
      expect(page).to have_content 'Diary created successfully'
      expect(page).to have_content 'Diary 1'
      expect(page).to have_content 'Diary 1 description'
      within('#prescription-table') do
        expect(page).to have_content user.email
        expect(page).to have_content 'Swiss Cottage'
      end
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

  context 'with a prescription' do
    scenario 'with valid params' do
      fill_in 'Title', with: 'Diary 1'
      fill_in 'Description', with: 'Diary 1 description'
      select 'Swiss Cottage', from: 'diary_prescription_ids'
      click_button 'Create Diary'
      expect(page).to have_content 'Diary created successfully'
      expect(page).to have_content 'Diary 1'
      expect(page).to have_content 'Diary 1 description'
      within('#prescription-table') do
        expect(page).to have_content user.email
        expect(page).to have_content 'Swiss Cottage'
      end
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

end
