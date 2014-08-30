Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  root to: "dashboards#index"
  resources :dashboards do
    get :search, on: :collection
    get :tag_search, on: :collection
    get :newest, on: :collection
    get :unanswered, on: :collection
  end

  get "about" => "statics#about"
  resources :questions do
    put "voteup", action: :voteup
    put "votedown", action: :voteup
  end
  resources :tags
  resources :answers do
    put "voteup", action: :voteup
    put "votedown", action: :voteup
  end
end
