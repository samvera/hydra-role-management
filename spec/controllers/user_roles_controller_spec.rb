require 'spec_helper'

describe UserRolesController do
  let(:ability) do
    ability = Object.new
    ability.extend(CanCan::Ability)
    controller.stub(:current_ability).and_return(ability)
    ability
  end

  let(:role) do
    Role.create(name: 'foo')
  end

  before(:each) do 
    @routes = Hydra::RoleManagement::Engine.routes
  end

  describe "with a user who cannot edit users" do
    it "should not be able to add a user" do
      lambda { post :create, role_id: role, user_key: 'foo@example.com'}.should raise_error CanCan::AccessDenied
    end
    it "should not be able to remove a user" do
      lambda { delete :destroy, role_id: role, id: 7}.should raise_error CanCan::AccessDenied
    end
  end

  describe "with a user who can edit users" do
    before do
      ability.can :read, Role
    end
    describe "adding users" do
      before do
        ability.can :add_user, Role
      end
      it "should not be able to add a user that doesn't exist" do
        User.should_receive(:find_by_email).with('foo@example.com').and_return(nil)
        post :create, role_id: role, user_key: 'foo@example.com'
        flash[:error].should == "Unable to find the user foo@example.com"
      end
      it "should be able to add a user" do
        u = User.create!(email: 'foo@example.com', password: 'password', password_confirmation: 'password')
        post :create, role_id: role, user_key: 'foo@example.com'
        role.reload.users.should == [u]
      end
    end
    describe "removing users" do
      before do
        ability.can :remove_user, Role
      end
      let (:user) do
        u = User.new(email: 'foo@example.com', password: 'password', password_confirmation: 'password')
        u.roles = [role]
        u.save!
        u
      end
      it "should be able to remove a user" do
        user.roles.should == [role]
        delete :destroy, role_id: role, id: user.id
        role.reload.users.should == []
      end
    end
  end
end

