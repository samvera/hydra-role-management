require 'spec_helper'

describe RolesController do
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
    it "should redirect to the homepage" do
      lambda { get :index }.should raise_error CanCan::AccessDenied
    end
  end

  describe "with a user who can edit users" do
    before do
      ability.can :read, Role
    end
    it "should be able to see the list of roles" do
      get :index
      response.should be_successful
      assigns[:roles].should == [role]
    end

    it "should be able to see a single role" do
      get :show, id: role
      response.should be_successful
      assigns[:role].should == role
    end
  end
end
