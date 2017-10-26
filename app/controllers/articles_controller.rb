class ArticlesController < ApplicationController

  before_action :find_article, only:[:edit, :update, :show, :destroy]

  def index
    @articles = Article.paginate(:page => params[:page], :per_page => 3)

    @articles = @articles.where("content like ? or title like ?",
                                "%#{params[:searching]}%",
                                "%#{params[:searching]}%")       if params[:searching]

    if @articles.count == 0
      redirect_to "/articles"
      flash[:alert] = "could not find article"
    end

    @articles = @articles.order("created_at")       if params[:sort].to_s == "created"
    @articles = @articles.order("created_at DESC")  if params[:sort].to_s == "created_desk"
    @articles = @articles.order("rating")           if params[:sort].to_s == "rating"
  end

  def new
    if params[:log].to_s == "admin" && params[:pass].to_s == "dfd"
      @article = Article.new
    else
      redirect_to "/articles"
    end
  end

  def edit
    if params[:log].to_s != "admin" || params[:pass].to_s != "dfd"
      redirect_to "/articles"
    end
  end

  def create
    @article = Article.create article_param

    if @article.errors.empty?
      redirect_to "/articles"
    else
      err_array = @article.errors[:title]
      err_array += @article.errors[:content]

      flash[:err] = err_array.join("<br/>").html_safe

      render "new"
    end
  end

  def update
    @article = Article.update article_param

    if @article.empty?
      render_404
    else
      redirect_to "/articles"
    end
  end

  def show
    @additional_articles = Article.where("id != #{@article.id}").order("created_at").limit(6)
  end

  def destroy
    if params[:log].to_s == "admin" && params[:pass].to_s == "dfd"
      @article.destroy
    else
      redirect_to "/articles"
    end
  end

  private

    def find_article
      @article = Article.where(:id => params[:id]).first

      unless @article
        render_404
      end
    end

    def article_param
      params.require(:article).permit(:category, :title, :subtitle, :content, :view_count, :rating, :main_pic)
    end
end
