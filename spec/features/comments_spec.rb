require "rails_helper"

RSpec.feature "companies' comments" do

  scenario "user can add a comments on companies profile" do
    company = create(:company)
    user = create(:user)

    visit company_path(company)
    click_on "Add comments"
    
    fill_in "nickname", with: user.nickname
    fill_in "comments", with: "Super boite"

    click_on "Ajouter mon commentaire"

    expect(page).to have_content(company.name)
    expect(page).to have_content(company.address)
    expect(page).to have_content(company.comment)

  end
end