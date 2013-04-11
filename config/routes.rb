Hydra::RoleManagement::Engine.routes.draw do
  # Generic file routes
  resources :roles, :only => [:index, :show, :new, :create] do
    resources :users, :only=>[:create, :destroy], :controller => "user_roles"
  end
end

