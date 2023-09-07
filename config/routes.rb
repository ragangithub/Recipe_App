Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "public_recipes#index"

  resources :foods, only: %i[index new create destroy]

  resources :recipes, only: %i[index show new create destroy] do
    member do
      patch :toggle_public
    end
    resources :recipe_foods, only: %i[create destroy index new]
  end
  
  get 'shopping_list', to: 'shopping_lists#index'
  get 'public_recipes', to: 'public_recipes#index'
end
