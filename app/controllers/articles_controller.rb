class ArticlesController < ApplicationController
  before_action :authenticate_admin!, :only => [:new, :create]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :song_link, :body)
    end
end
