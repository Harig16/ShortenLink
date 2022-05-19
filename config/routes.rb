Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "links#index"
  get '/new', to: "links#new"
  post '/links', to: "links#create"

  get '/:short_url' => "links#display"
end
