Rspechan::Application.routes.draw do
  namespace :admin do
    resources :rubies
    resources :nodes do
      match 'provision', to: 'nodes#provision'
    end
    match '/', to: 'nodes#index'
  end

  resources :organizations do
    resources :projects do
      resources :builds, only: [:index, :show] do
        collection do
          get 'enqueue'
        end
      end
    end
    match '/', to: 'dashboard#index'
  end

  namespace :api do
    resources :specs, only: [] do
      collection do
        post :create_failures
      end
    end
  end

  root to: 'dashboard#index'

end
