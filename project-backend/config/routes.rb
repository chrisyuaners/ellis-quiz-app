Rails.application.routes.draw do
  resources :answers
  resources :session_cards
  resources :card_choices
  resources :choices
  resources :cards
  resources :scores
  resources :sessions
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
