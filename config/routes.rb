Rails.application.routes.draw do
  post 'signup', controller: :signup, action: :create
  post 'signin', controller: :signin, action: :create
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
