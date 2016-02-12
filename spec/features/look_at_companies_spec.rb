require "rails_helper"

RSpec.feature "visit home page" do

  scenario "user can see existing companies" do
    company = create(:company)

    visit root_path
    click_on "Randstad"
    expect(page).to have_content(company.name)
    expect(page).to have_content(company.address)

  end
end