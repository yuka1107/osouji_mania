class FavoritesController < ApplicationController
  def create
    post_article = PostArticle.find(params[:post_article_id])
    favorite = current_user.favorites.new(post_article_id: post_article.id)
    favorite.save
    redirect_to post_article_path(post_article)
  end

  def destroy
    post_article = PostArticle.find(params[:post_article_id])
    favorite = current_user.favorites.find_by(post_article_id: post_article.id)
    favorite.destroy
    redirect_to post_article_path(post_article)
  end
end
