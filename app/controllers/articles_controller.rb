class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(params[:article])
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end  

  def show
    @article = Article.find(params[:id])
  end
  
  def index
  	@article = Article.all
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end

end
