class ArticlesController < ApplicationController
  #layout false
  before_action :authenticate_user!
  layout "admin_layout"


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id=current_user.id
    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def index

    @articles = Article.order("created_at desc")

  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.attributes = article_params
    if @article.save
      redirect_to articles_path
    else
      render 'edit'
    end
  end


  def show
    @article = Article.find(params[:id])
    layout false
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end



  private
    def article_params
      params.require(:article).permit(:title, :description, :content, :tag, :user_id)
    end
end
