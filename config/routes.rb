Rails.application.routes.draw do
  get "/show_products_by_category/:id", to: "products#show_products_by_category"

  resources :products
  resources :categories do
    
  end

  get 'categories/:id/product', to: 'categories#show_category_product', as: :show_category_product

  #search
  get "/search_by_name", to: "products#search_by_name"

  devise_for :users, only: [:session, :registrations], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  scope module: :users do
    resources :users, only: [:show, :edit] do
      collection do
        patch 'update_password'
      end
    end
  end

  devise_for :admin, only: [:session], controllers: {
    sessions: 'admin/sessions',
  }
  root 'welcome#home'
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end

  get '/get_brand_by_cate_id', to: "categories#get_brand_by_cate_id"
  get '/get_type_by_cate_id', to: "types#get_type_by_cate_id"
  get '/get_subtype_by_type_id', to: "types#get_subtype_by_type_id"  
end
