Vote4Me::Application.routes.draw do
  resources :ideas

  root to: "welcome#index"
  devise_for :users

end

