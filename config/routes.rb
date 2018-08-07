Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :businesses, defaults: { format: :json }, only: %i(index show)

  resource :session, only: %i(new create destroy) do 
    member do 
      get :log_out
    end
  end
end