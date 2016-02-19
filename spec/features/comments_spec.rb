require "rails_helper"

RSpec.feature "adding comments for company" do




  scenario "add comments by logged in user " do
  
    
    company = create(:company)
    visit company_path(company)
    expect(page).to have_selector('nickname', visible: false, text: @user.nickname)
    fill_in "stars", with: "5"
    fill_in "title", with: "great !"
    fill_in "review", with: "Super boite"

    click_on "Ajouter mon commentaire"

    expect(page).to have_content(company.name)
    expect(page).to have_content(company.address)
    expect(page).to have_content(company.comment)

  end
end