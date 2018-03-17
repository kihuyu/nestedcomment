Nestedcomments::Engine.routes.draw do
  resources :comments do
  resources  :comments
  end

  root to: "comments#index"
end
