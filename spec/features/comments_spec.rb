require "rails_helper"

RSpec.feature "adding comments for company" do

  before do
    
  end

  let :user do
     FactoryGirl.create(:user, nickname: "lollller", email: "abc@user.user", password: "password")
    end    

  scenario "by logged in user " do

    visit new_user_registration_path  
    fill_in 'user_email', :with => user.email    
    fill_in 'user_password', :with => user.password    
    fill_in 'user_password_confirmation', :with => user.password    
    click_button 'Sign up'    




    company = create(:company)
    

    visit company_path(company)
    puts page.body.inspect
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