Rails.application.routes.draw do
  resources :restaurants do
    resources :reviews, only: [ :new, :create, :index ]
    collection do                       # collection => no restaurant id in URL
      get 'top'                         # RestaurantsController#top
    end
    member do                             # member => restaurant id in URL
      get 'chef'                          # RestaurantsController#chef
    end
  end
   resources :reviews, only: [ :show, :edit, :update, :destroy ]
end
