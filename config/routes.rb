Rails.application.routes.draw do
  get 'conditions/:id/new',     to: 'conditions#new',   as: :new_condition
  post 'conditions/:id/create', to: 'conditions#create'
  get 'conditions/:id/edit',    to: 'conditions#edit',  as: :edit_conditions
  post 'conditions/:id/update', to: 'conditions#update'
  get 'conditions/:id/delete',  to: 'conditions#delete'

  get 'prizes/',            to: 'prizes#index', as: :prizes
  get 'prizes/new',         to: 'prizes#new',   as: :new_prize
  post 'prizes/',           to: 'prizes#create',as: :create_prize
  get 'prizes/:id/edit',    to: 'prizes#edit',  as: :edit_prize
  post 'prizes/:id/update', to: 'prizes#update'
  get 'prizes/:id/delete',  to: 'prizes#delete'

  root 'prizes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end