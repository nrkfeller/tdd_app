require 'rails_helper'

RSpec.feature "Listing articles" do
    
    before do
        @article1 = Article.create(title: 'First Article', body: 'First article body')
        @article2 = Article.create(title: 'Second Article', body: 'Second article body')
    end
   
   scenario "List all articles" do
       
       visit "/"
       
       expect(page).to have_content(@article1.title)
       expect(page).to have_content(@article2.title)
       expect(page).to have_content(@article1.body)
       expect(page).to have_content(@article2.body)
       expect(page).to have_link(@article1.title)
       expect(page).to have_link(@article2.title)
       
   end
    
end