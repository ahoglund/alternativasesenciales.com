AlternativasEsenciales::Application.routes.draw do
  root "pages#posts"
  get "home",                 to: "pages#home",      as: "home"
  get "/user/home",           to: "pages#user_home", as: "user_home"
  get "/contact",             to: "pages#contact",   as: "contact"
  get "/about",               to: "pages#about",     as: "about"
  get "category/:category",   to: 'pages#posts',     as: "category"
  get "posts",                to: "pages#posts",     as: "posts"
  get "posts/:id",            to: "pages#show_post", as: "post"

  post "/emailconfirmation",  to: "pages#email", as: "email_confirmation"
  resources :comments
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  namespace :admin do
    root "base#index"
    resources :users do    
      resources :avatar, to: 'user/avatar'
    end
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
    resources :posts
  end
end
