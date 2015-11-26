require 'rails_helper'

RSpec.feature "Creating Articles" do
   scenario "User creates new articles" do
      visit "/" # root
      
      click_link "New Article"
      
      fill_in "Title", with: "Creating first article"
      fill_in "Body", with: "Lorem ipsum"
      click_button "Create Article"
      
      
      expect(page).to have_content("Article has been created")
      expect(page.current_path).to eq(articles_path)
       
   end
    
end