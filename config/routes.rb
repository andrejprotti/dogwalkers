Rails.application.routes.draw do
  get 'dog_walkings/index'
  get 'dog_walkings/show/:identifier', to: 'dog_walkings#show'
  get 'dog_walkings/show'
  post 'dog_walkings/create'
  post 'dog_walkings/start_walk'
  post 'dog_walkings/finish_walk'

  root 'dog_walkings#index'
end
