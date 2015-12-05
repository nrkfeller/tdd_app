require 'rails_helper'
require 'support/macros'
RSpec.describe ArticlesController, type: :controller do

  describe "GET #get" do
    before do
      @nick = User.create(email: "nick@feller.com", password: "password")
    end
    
    context "owner is allowed to edit his articles" do
      it "renders the edit template" do
        login_user @nick
        article = Article.create(title: "title one", body: "body one", user: @nick)
        
        get :edit, id: article
        expect(response).to render_template :edit
      end
    end
    
    context "non-owner cannot edit or delete" do
      it "redirects to root path" do
        @adam = User.create(email: "adam@feller.com", password: "passwordd")
        
        login_user @adam
        
        article = Article.create(title: "nick article title", body: "article bosy from nick", user: @nick)
        
        get :edit, id: article
        expect(response).to redirect_to(root_path)
        
        message = 'You can only edit your own articles'
        expect(flash[:danger]).to eq message
        
      end
      
    end
    
    
    
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
  end

end
