Parachute::Application.routes.draw do

  root to: "posts#index"

  resources :posts do
    resources :comments
    resources :votes do
      collection do
        post "upvote"
        post "unvote"
      end
    end
  end

  resources :users do
    member do
      post "sign_in_as"
    end
  end

end
