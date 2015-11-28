require 'rails_helper'

RSpec.feature "Creating Articles" do
   
   before do
        @nick = User.create!(email: "me@nicolafeller.com", password: "password")
   end
   
   ############ SCENARIO 1 ############ 
   scenario "User creates new articles" do
      visit "/" # root
      
      click_link "Sign In"
      fill_in "Email", with: @nick.email
      fill_in "Password", with: @nick.password
      click_button "Log in"
      
      click_link "New Article"
      
      fill_in "Title", with: "Creating first article"
      fill_in "Body", with: "Lorem ipsum"
      click_button "Create Article"
      
      
      expect(page).to have_content("Article has been created")
      expect(page.current_path).to eq(articles_path)
       
   end
   
   ############ SCENARIO 2 ############ 
   scenario "User fails to create new article" do
      visit "/" # root
      
      click_link "Sign In"
      fill_in "Email", with: @nick.email
      fill_in "Password", with: @nick.password
      click_button "Log in"
      
      click_link "New Article"
      
      fill_in "Title", with: ""
      fill_in "Body", with: ""
      click_button "Create Article"
      
      expect(page).to have_content("Article has not been created")
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Body can't be blank")
   end
      
end