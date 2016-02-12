require "rails_helper"
RSpec.feature "adding company" do

  scenario "it allows a user to add a company" do
    visit new_company_path
    fill_in "name", with: "Mon album photo"
    fill_in "address", with: "12 rue Capricorne, Rungis"

    click_on "créer une entreprise"

    expect(page).to have_content("Mon album photo")
    expect(page).to have_content("12 rue Capricorne, Rungis")
  end

  context "the form is invalid" do
    scenario "they see a useful error message" do
      visit root_path
      click_on "New Company"
      fill_in "name", with: "Mon album photo"
      
      click_on "créer une entreprise"

      expect(page).to have_content "Address can't be blank"
    end
  end

  context "the form is invalid" do
    scenario "they see a useful error message" do
      visit root_path
      click_on "New Company"
      fill_in "address", with: "12 rue Capricorne, Rungis"
      
      click_on "créer une entreprise"

      expect(page).to have_content "Name can't be blank"
    end
  end
end