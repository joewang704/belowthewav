class ArticlesController < ApplicationController
  before_action :verify_poster,
                :only => [:new, :create]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
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

    def verify_poster
      (current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.poster?)
    end
end
