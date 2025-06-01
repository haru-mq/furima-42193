Rails.application.routes.draw do
  get 'frimas/index'
  devise_for :users

  root to: "frimas#index"
end
