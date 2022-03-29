Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/companies', to: 'companies#index'
  get '/companies/new', to: 'companies#new'
  post '/companies', to: 'companies#create'
  get '/companies/:id/edit', to: 'companies#edit'
  patch '/companies/:id', to: 'companies#update'
  delete '/companies/:id', to: 'companies#destroy'
  get '/companies/:id', to: 'companies#show'
  get '/snowboards', to: 'snowboards#index'
  patch '/snowboards/:id', to: 'snowboards#update'
  get '/snowboards/:id/edit', to: 'snowboards#edit'
  get '/snowboards/:id', to: 'snowboards#show'
  get '/companies/:id/snowboards/new', to: 'companies_snowboards#new'
  get '/companies/:id/snowboards?sort=alpha"', to: 'companies_snowboards#alphabetize'
  get '/companies/:id/snowboards', to: 'companies_snowboards#index'
  post '/companies/:id/snowboards', to: 'companies_snowboards#create'
end
