Rails.application.routes.draw do
  get 'dog_walkings/index'
  get 'dog_walkings/index/recent', to:  'dog_walkings#recent_index'
  get 'dog_walkings/show/:identifier', to: 'dog_walkings#show'
  get 'dog_walkings/show'
  post 'dog_walkings/create'
  post 'dog_walkings/start_walk/:identifier', to: 'dog_walkings#start_walk'
  post 'dog_walkings/finish_walk/:identifier', to: 'dog_walkings#finish_walk'

  root 'dog_walkings#index'
end
