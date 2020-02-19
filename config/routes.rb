Rails.application.routes.draw do
  get 'dog_walking/index'
  get 'dog_walking/show'
  get 'dog_walking/create'
  get 'dog_walking/start_walk'
  get 'dog_walking/finish_walk'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
