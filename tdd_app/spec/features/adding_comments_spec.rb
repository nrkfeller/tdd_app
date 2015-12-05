require 'rails_helper'

RSpec.feature "Adding Comments to articles" do
    before do
        @nick = User.create(email: "nick@feller.com", password: "password")
        @adam = User.create(email: "adam@feller.com", password: 'passwprd')
        
        @article = Article.create(title: 'article title', body: 'body body')
        
    end
    
    scenario "Allows users to leave comments on articles" do
        login_as(@nick)
        
        visit "/"
        click_link @article.title
        fill_in "New Comment", with: "sick article dude"
        click_button "Add Comment"
        
        expect(page).to have_content("Comment has been created")
        expect(page).to have_content("sick article dude")
        expect(current_path).to eq(article_path(@article.comments.last.id))
    end
end
        
        