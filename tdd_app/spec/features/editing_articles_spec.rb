require 'rails_helper'


RSpec.feature "Editing articles" do
    
    before do
        nick = User.create!(email: "me@nicolafeller.com", password: "password")
        login_as(nick)
        @article = Article.create(title: 'First Article', body: 'First article body', user: nick)
    end
    
    scenario "User can edit articles" do
        visit "/"
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: "Updated title"
        fill_in "Body", with: "Updated body"
        click_button "Update Article"
        
        expect(page).to have_content("Article has been updated")
        expect(page.current_path).to eq(article_path(@article))
        
    end
    
    scenario "A user fails to update and article" do
        visit "/"
        
        click_link @article.title
        click_link "Edit Article"
        
        fill_in "Title", with: ""
        fill_in "Body", with: "Updated body"
        click_button "Update Article"
        
        expect(page).to have_content("Article has not been updated")
        expect(page.current_path).to eq(article_path(@article))
        
    end
        
    
end