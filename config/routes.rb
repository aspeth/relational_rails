Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/companies', to: 'companies#index'
  get '/companies/:id', to: 'companies#show'
  get '/snowboards', to: 'snowboards#index'
end
