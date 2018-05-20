Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :categories, except: %w(new edit)
      resources :transactions, except: %w(new edit)
    end
  end
end
