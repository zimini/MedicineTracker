require "rails_helper"

RSpec.feature 'Can view diaries' do
  let!(:user) { FactoryBot.create(:user) }
  let!(:diary1) { FactoryBot.create(:diary, user: user) }
  let!(:diary2) { FactoryBot.create(:diary, title: 'Diary 2', description: 'Diary 2 description', user: user) }

  before do
    login_as(user)
    visit "/"
    click_link 'Your Diaries'
  end

  scenario 'list all diaries' do
    expect(page).to have_content "Diaries"
    expect(page).to have_content diary1.title
    expect(page).to have_content diary2.title
  end

  scenario 'show one diary details' do
    click_link 'Diary 1'
    expect(page.current_url).to eq diary_url(diary1)
    expect(page).to have_content diary1.title
    expect(page).to have_content diary1.description
  end
end
