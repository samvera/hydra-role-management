Hydra::RoleManagement::Engine.routes.draw do
  # Generic file routes
  resources :roles, Hydra::RoleManagement.route_options do
    resources :users, :only=>[:create, :destroy], :controller => "user_roles"
  end
end

