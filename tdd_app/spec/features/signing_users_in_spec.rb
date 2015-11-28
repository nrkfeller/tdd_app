require 'rails_helper'

RSpec.feature "User Sign In" do
    
    before do
        @nick = User.create!(email: "me@nicolafeller.com", password: "password")
    end
   
   scenario "User signs himself in" do
       
       visit "/"
       
        click_link "Sign In"
        fill_in "Email", with: @nick.email
        fill_in "Password", with: @nick.password
        click_button "Log in"
       
       expect(page).to have_content("Signed in successfully")
       expect(page).to have_content("Signed in as #{@nick.email}")
    
    end
end

