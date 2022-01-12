class PostArticlesController < ApplicationController
  def new
    @post_article = PostArticle.new
  end

  # 投稿データの保存
  def create
    @post_article = current_user.post_article.new(post_article_params)
    # 受け取ったタグの値を「スペース」で区切って配列にする
    tag_list = params[:post][:name].split(nill)
    if @post_article.save
      @post_article.save_tag(tag_list)
      redirect_to post_articles_path, flash: { notice: "「掃除メソッドを投稿しました。」" }
    else
      redirect_to new_post_article_path, flash: {error_messeages: post_article.errors.full_messages }
    end
  end

  def index
    @post_articles = PostArticle.page(params[:page]).per(10) #ビューで投稿一覧を表示するために全取得
    @post_article = current_user.post_articles.new #ビューのform_withのmodelに使う
    @tag_list = Tag.all #ビューでタグ一覧を表示するために全取得
  end

  def show
    @post_article = PostArticle.find(params[:id]) #クリックした投稿を取得。
    @post_tags = @post.tags # そのクリックした投稿に紐づけられているタグの取得。
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
