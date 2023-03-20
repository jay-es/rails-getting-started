Rails.application.routes.draw do
  root "articles#index" # ArticlesController の indexアクションに対応

  get "/articles", to: "articles#index"
end
