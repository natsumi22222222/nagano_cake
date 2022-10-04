Rails.application.routes.draw do

  root "public/homes#top"


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
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    patch "customers/:id/edit" => "customers#:id/edit"
  end

  scope module: :admin do
    get "admin" => "homes#top"
  end

  scope module: :public do
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
    resources :orders, only: [:new, :index, :create, :show]
    resources :cart_items, only:[:index, :update, :destroy , :create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers, only:[:show, :edit,:update]
    resources :items, only:[:index, :show]
    resources :homes, only: [:top]
    get "about" => "homes#about"
    get "my_page" => "customers#show"
    get "orders/confirm" => "orders#confirm"
  end


end