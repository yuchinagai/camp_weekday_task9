Rails.application.routes.draw do
  resources :tasks do
  collection do
    get :hide
  end
end
