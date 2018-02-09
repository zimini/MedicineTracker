require "rails_helper"

RSpec.feature 'Can view diaries' do
  let!(:diary1) { FactoryBot.create(:diary) }
  let!(:diary2) { FactoryBot.create(:diary, title: 'Diary 2', description: 'Diary 2 description') }

  before do
    visit "/"
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
