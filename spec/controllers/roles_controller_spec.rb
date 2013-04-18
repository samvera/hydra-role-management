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
    it "should redirect to the homepage" do
      lambda { get :show, id: role }.should raise_error CanCan::AccessDenied
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

  describe "with a user who can create roles" do
    before do
      ability.can :create, Role
    end
    it "should be able to make a new role" do
      get :new
      response.should be_successful
      assigns[:role].should be_kind_of Role
    end

    it "should be able to create a new role" do
      post :create, :role=>{name: 'my_role'} 
      response.should redirect_to @routes.url_helpers.roles_path
      assigns[:role].should_not be_new_record
      assigns[:role].name.should == 'my_role'
    end
    it "should not create role with an error" do
      post :create, :role=>{name: 'my role'} 
      assigns[:role].name.should == 'my role'
      assigns[:role].errors[:name].should == ['Only letters, numbers, hyphens, underscores and periods are allowed']
      response.should be_successful
    end
  end

end
