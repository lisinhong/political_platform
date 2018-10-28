Rails.application.routes.draw do
  resources :politics
  resources :politicians
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "politicians#index"
  get 'hashtags' => 'politicians#hashtags'
  post 'hashtags' => 'politicians#get_hashtags'
  post 'hashtags/add' => 'politicians#add_hashtag'
  get  'playground' => "politicians#playground"
end
