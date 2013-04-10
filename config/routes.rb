Hydra::RoleManagement::Engine.routes.draw do
  # Generic file routes
  resources :roles, :only => [:index, :show, :new, :create] do
    member do
      post 'add_user'
    end
  end
end

