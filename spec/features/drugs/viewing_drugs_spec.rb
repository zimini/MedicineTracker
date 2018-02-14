require 'rails_helper'

RSpec.feature 'Users can view drugs' do
  let(:user) { FactoryBot.create(:user) }
  let!(:drug1) { FactoryBot.create(:drug, user: user) }
  let!(:drug2) { FactoryBot.create(:drug, user: user, brand: 'GSK', name: 'Aspirin', dose: '20mg' ) }

  before do
    login_as(user)
    visit drugs_path
  end

  scenario 'they have created' do
    expect(page).to have_content drug1.brand
    expect(page).to have_content drug1.name
    expect(page).to have_content drug1.dose

    expect(page).to have_content drug2.brand
    expect(page).to have_content drug2.name
    expect(page).to have_content drug2.dose
  end
end
