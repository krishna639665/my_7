class ArticlesController < ApplicationController
  

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:notice] = "Articles was created successfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(article_params)
      flash[:notice] = "Articles was updated successfully."
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Articles was deleted successfully."
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    
    params.require(:article).permit(:title, :description)
  end
end
