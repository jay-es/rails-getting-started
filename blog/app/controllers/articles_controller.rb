class ArticlesController < ApplicationController
  def index
    # ビューを明示的にレンダリングしない場合や HTTP レスポンスをトリガーしない場合
    # コントローラ名とアクション名にマッチするビューが自動的にレンダリングされる
    # （この場合 app/views/articles/index.html.erb）
  end
end
