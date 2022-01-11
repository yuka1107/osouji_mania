class PostArticlesController < ApplicationController
  def new
    @post_article = PostArticle.new
  end

  # 投稿データの保存
  def create
    @post_article = PostArticle.new(post_article_params)
    @post_article.user_id = current_user.id
    if @post_article.save
      redirect_to post_articles_path, flash: { notice: "「掃除メソッドを投稿しました。」" }
    else
      redirect_to new_post_article_path, flash: {error_messeages: post_article.errors.full_messages }
    end
  end

  def index
    @post_articles = PostArticle.all
  end

  def show
    @post_article = PostArticle.find(params[:id])
    @post_comments = PostComment,new
  end

  def edit
    @post_article = PostArticle.find(params[:id])
    if @post_article.user == current_user
      render :edit
    end
  end

  def update
    @post_article = PostArticle.find(params[:id])
    @post_article.update(post_article_params)
  end

  def destroy
    @post_article = PostArticle.find(params[:id])
    @post_article.destroy
    redirect_to post_articles_path, flash: { notice: "「掃除メソッドを削除にしました。」" }
  end

  private
  def post_article_params
    params.require(:post_article).permit(:title, :image, :caption, :is_active)
  end

end
