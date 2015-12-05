require 'rails_helper'

RSpec.feature "Signing users out" do
    
    before do
        @nick = User.create!(email: "me@nicolafeller.com", password: "password")
        visit "/"
       
        click_link "Sign In"
        fill_in "Email", with: @nick.email
        fill_in "Password", with: @nick.password
        click_button "Log in"
        
    end
        
    scenario "User signs himself in" do
       visit "/"
       
       click_link "Sign Out"
       
       expect(page).to have_content("Signed out successfully.")
    
    end
end