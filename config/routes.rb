Hydra::RoleManagement::Engine.routes.draw do
  # Generic file routes
  resources :roles do
    resources :users, :only=>[:create, :destroy], :controller => "user_roles"
  end
end

