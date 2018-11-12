Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :politics
  resources :politicians
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "politicians#index"
  get 'hashtags' => 'politicians#hashtags'
  post 'hashtags' => 'politicians#get_hashtags'
  post 'hashtags/add' => 'politicians#add_hashtag'
  post 'politics/destroy' => 'politics#destroy'
  post 'ajax_update' => 'politics#ajax_update'
  get  'hashtags/delete' => 'politicians#delete_hashtag'
  get  'playground' => "playgrounds#index"

  # API 
  post 'api/get_second_step_questions' => "playgrounds#get_second_step_questions"
end
