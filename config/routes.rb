Rails.application.routes.draw do
  get 'conditions/:id/new',     to: 'conditions#new',     as: :new_condition
  post 'conditions/:id/create', to: 'conditions#create'
  get 'conditions/:id/delete',  to: 'conditions#delete'
  
  get 'prizes/',                to: 'prizes#index',       as: :prizes
  get 'prizes/new',             to: 'prizes#new',         as: :new_prize
  post 'prizes/',               to: 'prizes#create',      as: :create_prize
  get 'prizes/:id/edit',        to: 'prizes#edit',        as: :edit_prize
  post 'prizes/:id/update',     to: 'prizes#update'
  get 'prizes/:id/delete',      to: 'prizes#delete'
  
  get '/',                      to: 'subscribers#home'
  post 'subscribers/',           to: 'subscribers#create', as: :subscriber
  root 'subscribers#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end