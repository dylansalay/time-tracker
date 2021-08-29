Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'schedules#index'
  
  resources :schedules do
    resources :work_orders
  end
end
