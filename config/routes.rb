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
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :homes, only: [:top]
  end

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :index, :create, :show, :confirm, :complete]
    resources :cart_items, only:[:index, :update, :destroy ,:destroy_all, :create]
    resources :customers, only:[:show, :edit,:update, :unsubscribe, :withdraw]
    resources :items, only:[:index, :show]
    resources :homes, only: [:top, :about]
  end






end
