Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/v1/find-country', to: 'main#find_geo_by_ip'

end
