require 'rails_helper'

RSpec.feature "Showing and article" do 

    before do
        @nick = User.create(email: "nicolas@feller.com", password: "password")
        @adam = User.create(email: "adam@feller.com", password: "passphrase")
        @article = Article.create(title: "The first article", body: "Body of the first article", user: @nick)
    end
    
    scenario "Cannot edit or delete if not signed in" do
        visit"/"
        
        click_link @article.title
        
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
        
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
        
    end
    
    scenario "Cannot edit or delete if not article creator" do
        
        login_as(@fred)
        visit"/"
        
        click_link @article.title
        
        
        expect(page).not_to have_link("Edit Article")
        expect(page).not_to have_link("Delete Article")
        
    end
    
    scenario "Signed in owner sees delete and edit" do
        
        login_as(@nick)
        visit"/"
        
        click_link @article.title
        
        
        expect(page).to have_link("Edit Article")
        expect(page).to have_link("Delete Article")
        
    end
        


    scenario "Display individial article" do
        
        visit"/"
        
        click_link @article.title
        
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
    
    
    end
end
    
    