class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    set_article
  end

  def create
    # render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article succsessfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    set_article
    if @article.update(article_params)
      flash[:notice] = "Article succsessfully edited"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
    set_article
  end

  def destroy
    set_article
    @article.delete
    flash[:notice] = "Article succsessfully deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :description)
    end
end
