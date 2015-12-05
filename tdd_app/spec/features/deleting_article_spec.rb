require 'rails_helper'

RSpec.feature "Deleting and article" do
   
    before do
        nick = User.create!(email: "me@nicolafeller.com", password: "password")
        login_as(nick)
        @article = Article.create(title: 'First Article', body: 'First article body', user: nick)
    end
    
    scenario "User deletes and article" do
        visit "/"
        
        click_link @article.title
        click_link "Delete Article"
        
        expect(page).to have_content("Article has been deleted")
        expect(current_path).to eq(articles_path)
        
    end
    
end

