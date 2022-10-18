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
    resources :items, except: [:destroy]
    patch "customers/:id/edit" => "customers#:id/edit"
  end

  scope module: :admin do
    get "admin" => "homes#top", as: :admin_top
  end

  scope module: :public do
    resources :addresses, except: [:new]
    get "orders/complete" => "orders#complete"
    resources :orders, only: [:new,:create, :index, :show]
    resources :cart_items, only:[:index, :create, :update, :destroy , :create] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers, only:[:show, :edit, :update]
    resources :items, only:[:index, :show]
    resources :homes, only: [:top]
    get "about" => "homes#about"
    get "my_page" => "customers#show"
    get "orders/confirm" => "orders#confirm"
    post "orders/confirm" => "orders#confirm"
    get "customers/infomation/edit" => "infomation#edit"
    patch "customers/infomation" => "infomation#edit"
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
  end


end