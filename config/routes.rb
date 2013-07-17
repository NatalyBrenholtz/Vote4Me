Vote4Me::Application.routes.draw do
  resources :ideas do
    member { post :vote }
  end

  root to: "welcome#index"
  devise_for :users

end

