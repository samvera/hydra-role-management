# frozen_string_literal: true

describe UserRolesController do
  let(:ability) do
    ability = Object.new
    ability.extend(CanCan::Ability)
    allow(controller).to receive(:current_ability).and_return(ability)

    ability
  end

  let(:role) do
    Role.create(name: 'foo')
  end

  before do
    @routes = Hydra::RoleManagement::Engine.routes
  end

  describe 'with a user who cannot edit users' do
    it 'is not able to add a user' do
      expect { post :create, params: { role_id: role, user_key: 'foo@example.com' } }.to raise_error CanCan::AccessDenied
    end
    it 'is not able to remove a user' do
      expect { delete :destroy, params: { role_id: role, id: 7 } }.to raise_error CanCan::AccessDenied
    end
  end

  describe 'with a user who can edit users' do
    before do
      ability.can :read, Role
    end
    describe 'adding users' do
      before do
        ability.can :add_user, Role
      end
      it "is not able to add a user that doesn't exist" do
        allow(User).to receive(:find_by_email).and_return(nil)
        post :create, params: { role_id: role, user_key: 'foo@example.com' }
        expect(User).to have_received(:find_by_email).with('foo@example.com')
        expect(flash[:error]).to eq 'Invalid user foo@example.com'
      end
      it 'is able to add a user' do
        u = User.create!(email: 'foo@example.com', password: 'password', password_confirmation: 'password')
        post :create, params: { role_id: role, user_key: 'foo@example.com' }
        expect(role.reload.users).to eq [u]
      end
    end
    describe 'removing users' do
      before do
        ability.can :remove_user, Role
      end
      let(:user) do
        u = User.new(email: 'foo@example.com', password: 'password', password_confirmation: 'password')
        u.roles = [role]
        u.save!
        u
      end
      it 'is able to remove a user' do
        expect(user.roles).to eq [role]
        delete :destroy, params: { role_id: role, id: user.id }
        expect(role.reload.users).to eq []
      end
    end
  end
end
