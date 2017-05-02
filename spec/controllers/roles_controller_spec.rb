describe RolesController do
  let(:ability) do
    ability = Object.new
    ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability).and_return(ability)
    ability
  end

  let(:role) do
    Role.create(name: 'foo')
  end

  before(:each) do
    @routes = Hydra::RoleManagement::Engine.routes
  end

  describe "with a user who cannot edit roles" do
    it "should not be able to view role index" do
      expect { get :index, params: {} }.to raise_error CanCan::AccessDenied
    end
    it "should not be able to view role" do
      expect { get :show, params: { id: role } }.to raise_error CanCan::AccessDenied
    end
    it "should not be able to view new role form" do
      expect { get :new }.to raise_error CanCan::AccessDenied
    end
    it "should not be able to create a role" do
      expect { post :create, params: { role: { name: 'my_role' } } }.to raise_error CanCan::AccessDenied
    end
    it "should not be able to update a role" do
      expect { put :update, params: { id: role } }.to raise_error CanCan::AccessDenied
    end
    it "should not be able to remove a role" do
      expect { delete :destroy, params: { id: role } }.to raise_error CanCan::AccessDenied
    end
  end

  describe "with a user who can read roles" do
    before do
      ability.can :read, Role
    end
    it "should be able to see the list of roles" do
      get :index
      expect(response).to be_successful
      expect(assigns[:roles]).to eq [role]
    end

    it "should be able to see a single role" do
      get :show, params: { id: role }
      expect(response).to be_successful
      expect(assigns[:role]).to eq role
    end
  end

  describe "with a user who can only update role 'foo'" do
    it "should be redirected to edit" do
      ability.can :read, Role
      ability.can :update, Role, id: role.id
      get :show, params: { id: role }
      expect(response).to redirect_to @routes.url_helpers.edit_role_path(assigns[:role])
    end
  end

  describe "with a user who can create roles" do
    before do
      ability.can :create, Role
    end
    it "should be able to make a new role" do
      get :new
      expect(response).to be_successful
      expect(assigns[:role]).to be_kind_of Role
    end

    it "should be able to create a new role" do
      post :create, params: { role: { name: 'my_role' } }
      expect(response).to redirect_to @routes.url_helpers.edit_role_path(assigns[:role])
      expect(assigns[:role]).not_to be_new_record
      expect(assigns[:role].name).to eq 'my_role'
    end
    it "should not create role with an error" do
      post :create, params: { role: { name: 'my role' } }
      expect(assigns[:role].name).to eq 'my role'
      expect(assigns[:role].errors[:name]).to eq ['Only letters, numbers, hyphens, underscores and periods are allowed']
      expect(response).to be_successful
    end
  end

  describe "with a user who can update roles" do
    before do
      ability.can :update, Role
    end

    it "should be able to update a role" do
      put :update, params: { id: role, role: { name: 'my_role' } }
      expect(response).to redirect_to @routes.url_helpers.edit_role_path(assigns[:role])
      expect(assigns[:role]).not_to be_new_record
      expect(assigns[:role].name).to eq 'my_role'
    end
    it "should not update role with an error" do
      put :update,  params: { id: role, role: { name: 'my role' } }
      expect(assigns[:role].name).to eq 'my role'
      expect(assigns[:role].errors[:name]).to eq ['Only letters, numbers, hyphens, underscores and periods are allowed']
      expect(response).to be_successful
    end
  end

  describe "with a user who can remove roles" do
    before do
      ability.can :destroy, Role
    end

    it "should be able to destroy a role" do
      delete :destroy, params: { id: role }
      expect(response).to redirect_to @routes.url_helpers.roles_path
    end
  end
end
