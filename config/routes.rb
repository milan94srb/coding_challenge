Rails.application.routes.draw do
  root "dashboards#show"

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/sign_in', to: 'users/sessions#new', as: :new_user_session
    get 'users/sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  resources :verticals, :categories, :courses
  
  get "/verticals" => "verticals#index"
  post "/verticals" => "verticals#create"
  get "/verticals/new" => "verticals#new"
  get "/verticals/:id" => "verticals#show"
  patch "/verticals/:id" => "verticals#update"
  delete "/verticals/:id" => "verticals#destroy"
  get "/verticals/:id/edit" => "verticals#edit"
  get "/verticals/:id/delete" => "verticals#delete"

  get "/categories" => "categories#index"
  post "/categories" => "categories#create"
  get "/categories/new" => "categories#new"
  get "/categories/:id" => "categories#show"
  patch "/categories/:id" => "categories#update"
  delete "/categories/:id" => "categories#destroy"
  get "/categories/:id/edit" => "categories#edit"
  get "/categories/:id/delete" => "categories#delete"

  get "/courses" => "courses#index"
  post "/courses" => "courses#create"
  get "/courses/new" => "courses#new"
  get "/courses/:id" => "courses#show"
  patch "/courses/:id" => "courses#update"
  delete "/courses/:id" => "courses#destroy"
  get "/courses/:id/edit" => "courses#edit"
  get "/courses/:id/delete" => "courses#delete"
end
