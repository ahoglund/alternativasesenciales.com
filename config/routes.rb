# == Route Map
#
#                   Prefix Verb   URI Pattern                       Controller#Action
#                     root GET    /                                 pages#home
#                     home GET    /home(.:format)                   pages#home
#                   inside GET    /inside(.:format)                 pages#inside
#                  contact GET    /contact(.:format)                pages#contact
#       email_confirmation POST   /emailconfirmation(.:format)      pages#email
#                    posts GET    /posts(.:format)                  pages#posts
#                     post GET    /posts/:id(.:format)              pages#show_post
#         new_user_session GET    /users/sign_in(.:format)          devise/sessions#new
#             user_session POST   /users/sign_in(.:format)          devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)         devise/sessions#destroy
#            user_password POST   /users/password(.:format)         devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)     devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)    devise/passwords#edit
#                          PATCH  /users/password(.:format)         devise/passwords#update
#                          PUT    /users/password(.:format)         devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
#        user_registration POST   /users(.:format)                  devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)          devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)             devise/registrations#edit
#                          PATCH  /users(.:format)                  devise/registrations#update
#                          PUT    /users(.:format)                  devise/registrations#update
#                          DELETE /users(.:format)                  devise/registrations#destroy
#        user_confirmation POST   /users/confirmation(.:format)     devise/confirmations#create
#    new_user_confirmation GET    /users/confirmation/new(.:format) devise/confirmations#new
#                          GET    /users/confirmation(.:format)     devise/confirmations#show
#               admin_root GET    /admin(.:format)                  admin/base#index
#              admin_users GET    /admin/users(.:format)            admin/users#index
#                          POST   /admin/users(.:format)            admin/users#create
#           new_admin_user GET    /admin/users/new(.:format)        admin/users#new
#          edit_admin_user GET    /admin/users/:id/edit(.:format)   admin/users#edit
#               admin_user GET    /admin/users/:id(.:format)        admin/users#show
#                          PATCH  /admin/users/:id(.:format)        admin/users#update
#                          PUT    /admin/users/:id(.:format)        admin/users#update
#                          DELETE /admin/users/:id(.:format)        admin/users#destroy
#       admin_posts_drafts GET    /admin/posts/drafts(.:format)     admin/posts#drafts
#    admin_posts_dashboard GET    /admin/posts/dashboard(.:format)  admin/posts#dashboard
#              admin_posts GET    /admin/posts(.:format)            admin/posts#index
#                          POST   /admin/posts(.:format)            admin/posts#create
#           new_admin_post GET    /admin/posts/new(.:format)        admin/posts#new
#          edit_admin_post GET    /admin/posts/:id/edit(.:format)   admin/posts#edit
#               admin_post GET    /admin/posts/:id(.:format)        admin/posts#show
#                          PATCH  /admin/posts/:id(.:format)        admin/posts#update
#                          PUT    /admin/posts/:id(.:format)        admin/posts#update
#                          DELETE /admin/posts/:id(.:format)        admin/posts#destroy
#

AlternativasEsenciales::Application.routes.draw do
  root "pages#posts"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  get "/about", to: "pages#about", as: "about"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"
  get 'category/:category', to: 'pages#posts', as: "category"
  get "posts", to: "pages#posts", as: "posts"
  get "posts/:id", to: "pages#show_post", as: "post"
  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
    get "posts/drafts", to: "posts#drafts", as: "posts_drafts"
    get "posts/dashboard", to: "posts#dashboard", as: "posts_dashboard"
    resources :posts
  end

end
