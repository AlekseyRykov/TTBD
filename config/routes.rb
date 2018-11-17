Rails.application.routes.draw do

  resources :projects do
    resources :tasks do
      member do
        patch :complete
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
