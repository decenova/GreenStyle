Rails.application.routes.draw do
  resources :products
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'welcome#home'
  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  

end
