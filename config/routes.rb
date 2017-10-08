Rails.application.routes.draw do
  get 'conditions/create'

  get 'prizes/',to: 'prizes#index', as: :prizes
  post 'prizes/', to: 'prizes#create'
  get 'prizes/new', to: 'prizes#new',   as: :new_post
  post 'prizes/edit', to: 'prizes#edit'
  delete 'prizes/delete', to: 'prizes#delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end