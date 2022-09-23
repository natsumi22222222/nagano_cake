Rails.application.routes.draw do

  root "admin/homes#top"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    resources :orders, only: [:show]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :homes, only: [:top, :about]
  end

  namespace :public do
    resources :addresses, only: [:index, :edit]
    resources :orders, only: [:index, :show, :confirm, :complete]
    resources :cart_items, only:[:index]
    resources :customers, only:[:show, :edit, :unsubscribe]
    resources :items, only:[:index, :show]
  end






end
