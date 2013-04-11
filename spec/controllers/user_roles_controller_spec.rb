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

  describe "with a user who cannot edit users" do
    it "should not be able to add a user" do
      lambda { post :create, role_id: role, user_key: 'foo@example.com'}.should raise_error CanCan::AccessDenied
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
        User.should_receive(:find_by_user_key).with('foo@example.com').and_return(nil)
        post :create, role_id: role, user_key: 'foo@example.com'
        flash[:error].should == "Unable to find the user foo@example.com"
      end
      it "should be able to add a user" do
        u = User.create!(email: 'foo@example.com', password: 'password', password_confirmation: 'password')
        post :create, role_id: role, user_key: 'foo@example.com'
        role.reload.users.should == [u]
      end
    end
  end
end

