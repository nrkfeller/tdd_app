require 'rails_helper'

RSpec.feature "Showing and article" do 

    before do
        @article = Article.create(title: "The first article", body: "Body of the first article")
    end


    scenario "Display individial article" do
        
        visit"/"
        
        click_link @article.title
        
        
        expect(page).to have_content(@article.title)
        expect(page).to have_content(@article.body)
        expect(current_path).to eq(article_path(@article))
    
    
    end
end
    
    