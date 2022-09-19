Rails.application.routes.draw do

  get 'homes/top'
  devise_for :admins
  devise_for :customers
  
  root "homes#top"
  
end
