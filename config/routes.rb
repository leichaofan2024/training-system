Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  namespace :admin do
    resources :scenes do
      resources :switches do
        member do
          post :light_toggle
        end
      end
      resources :lights
    end
  end

  resources :scenes do

    resources :switches do
      member do
        post :training_light_toggle
      end
    end
    resources :lights
  end
end
