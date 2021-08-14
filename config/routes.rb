Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :artists, only: :index do
        get :albums, on: :member
      end


    end
  end
end