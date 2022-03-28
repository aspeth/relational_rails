Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  get '/companies/:id', to: 'companies#show'
  get '/snowboards', to: 'snowboards#index'
  get '/snowboards/:id', to: 'snowboards#show'
  get '/companies/:id/snowboards', to: 'companies_snowboards#index'
end
