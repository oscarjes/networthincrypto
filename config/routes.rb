Rails.application.routes.draw do
  root 'home#index'

  post 'submit' => 'home#calculate'
  get 'submit' => 'home#index'
  get 'about' => 'home#about'

  get 'thanks' => 'home#thanks'
  get 'confirmed' => 'home#confirmed'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
