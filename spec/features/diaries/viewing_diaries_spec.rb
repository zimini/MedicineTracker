require "rails_helper"

RSpec.feature 'Can view diaries' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:diary1) { FactoryBot.create(:diary, user: user) }
  let!(:diary2) { FactoryBot.create(:diary, title: 'Diary 2', description: 'Diary 2 description', user: user) }
  let!(:prescription1) { FactoryBot.create(:prescription, user: user)}
  let!(:prescription2) { FactoryBot.create(:prescription, user: user, clinic: 'West Hampstead')}

  before do
    login_as(user)
  end

  context 'without a prescription' do

    scenario 'list all diaries' do
      visit "/"
      click_link 'My Diaries'

      expect(page).to have_content "Diaries"
      expect(page).to have_content diary1.title
      expect(page).to have_content diary2.title
      expect(page).to_not have_content prescription1.clinic
      expect(page).to_not have_content prescription2.clinic
    end

    scenario 'show one diary details' do
      visit "/"
      click_link 'My Diaries'
      click_link 'Diary 1'

      expect(page.current_url).to eq diary_url(diary1)
      expect(page).to have_content diary1.title
      expect(page).to have_content 'No Prescription associated with this diary.'
    end
  end

  context 'with a prescription' do
    scenario 'list all diaries' do
      diary1.prescription = prescription1
      diary2.prescription = prescription2

      visit "/"
      click_link 'My Diaries'

      expect(page).to have_content "Diaries"
      expect(page).to have_content diary1.title
      expect(page).to have_content diary2.title
      expect(page).to have_content prescription1.clinic
      expect(page).to have_content prescription2.clinic
    end

    scenario 'show one diary details' do
      diary1.prescription = prescription1

      visit "/"
      click_link 'My Diaries'

      click_link 'Diary 1'
      expect(page.current_url).to eq diary_url(diary1)
      expect(page).to have_content diary1.title
      expect(page).to_not have_content 'No Prescription associated with this diary.'
    end
  end
end
