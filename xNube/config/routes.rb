Rails.application.routes.draw do
  resources :exceps
  resources :inventarios
  get 'servicios/index'
  get 'servicios/descargar_stocks' 
  get 'servicios/view_xml' 

  get 'servicios/borrar_bd_excep'
  get 'servicios/agregar_excep'
  #get 'servicios/view_xml'

  
  root 'servicios#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
