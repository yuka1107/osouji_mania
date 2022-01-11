class PostCommentsController < ApplicationController
  def create
    post_article = PostArticle.find(params[:post_article.id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_article_id = post_article.id
    comment.save
    redirect_to post_article_path(post_article)
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_article_path(params[:post_article_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end