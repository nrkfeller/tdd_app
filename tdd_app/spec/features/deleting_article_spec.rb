require 'rails_helper'

RSpec.feature "Deleting and article" do
   
    before do
        @article = Article.create(title: 'First Article', body: 'First article body')
        @nick = User.create!(email: "me@nicolafeller.com", password: "password")
    end
    
    scenario "User deletes and article" do
        visit "/"
        
        click_link "Sign In"
        fill_in "Email", with: @nick.email
        fill_in "Password", with: @nick.password
        click_button "Log in"
        
        click_link @article.title
        click_link "Delete Article"
        
        expect(page).to have_content("Article has been deleted")
        expect(current_path).to eq(articles_path)
        
    end
    
end

