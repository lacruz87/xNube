Rails.application.routes.draw do
  resources :inventarios
  get 'servicios/index'
  get 'servicios/descargar_stocks' 
  get 'servicios/view_xml' 

  
  root 'servicios#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
