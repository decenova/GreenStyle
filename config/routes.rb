Rails.application.routes.draw do
  resources :products
  devise_for :users, only: [:session, :registrations], controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
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
