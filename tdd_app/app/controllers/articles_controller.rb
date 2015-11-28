class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_filter :find_params, only: [:show, :destroy, :edit, :update]
  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article has been created"
      redirect_to articles_path
    else
      # .now so that it does not persist to next page
      flash.now[:danger] = "Article has not been created"
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article has been updated"
      redirect_to @article
    else
      flash[:danger] = "Article has not been updated"
      render :edit
    end
  end
  
  def destroy
    if @article.destroy
      flash[:success] = "Article has been deleted"
      redirect_to articles_path
    end
  end
  
  private
    def article_params
      params.require(:article).permit(:title,:body)
    end
    
    def find_params
      @article = Article.find(params[:id])
    end
end
