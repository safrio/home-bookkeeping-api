Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :categories, only: %w(create index update destroy)
      resources :transactions, only: %w(create index update destroy)
    end
  end
end
