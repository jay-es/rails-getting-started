class ArticlesController < ApplicationController
  def index
    # ビューを明示的にレンダリングしない場合や HTTP レスポンスをトリガーしない場合
    # コントローラ名とアクション名にマッチするビューが自動的にレンダリングされる
    # （この場合 app/views/articles/index.html.erb）

    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # 新しい記事を1件インスタンス化、データベースには保存しない
  def new
    @article = Article.new
  end

  # タイトルと本文を持つ新しい記事をインスタンス化し、データベースへ保存
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def article_params
    # 許容するフィールドを指定してフィルター
    params.require(:article).permit(:title, :body)
  end
end
