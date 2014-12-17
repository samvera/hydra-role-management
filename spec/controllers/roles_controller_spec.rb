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

  before(:each) do 
    @routes = Hydra::RoleManagement::Engine.routes
  end
  
  describe "with a user who cannot edit roles" do
    it "should not be able to view role index" do
      lambda { get :index }.should raise_error CanCan::AccessDenied
    end
    it "should not be able to view role" do
      lambda { get :show, id: role }.should raise_error CanCan::AccessDenied
    end
    it "should not be able to view new role form" do
      lambda { get :new }.should raise_error CanCan::AccessDenied
    end
    it "should not be able to create a role" do
      lambda { post :create, :role=>{name: 'my_role'}}.should raise_error CanCan::AccessDenied
    end
    it "should not be able to update a role" do
      lambda { put :update, id: role}.should raise_error CanCan::AccessDenied
    end
    it "should not be able to remove a role" do
      lambda { delete :destroy, id: role}.should raise_error CanCan::AccessDenied
    end
  end

  describe "with a user who can read roles" do
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

  describe "with a user who can only update role 'foo'" do
    it "should be redirected to edit" do
      ability.can :read, Role
      ability.can :update, Role, id: role.id
      get :show, id: role
      response.should redirect_to @routes.url_helpers.edit_role_path(assigns[:role])
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

  describe "with a user who can update roles" do
    before do
      ability.can :update, Role
    end

    it "should be able to update a role" do
      put :update, id: role, :role=>{name: 'my_role'} 
      response.should redirect_to @routes.url_helpers.roles_path
      assigns[:role].should_not be_new_record
      assigns[:role].name.should == 'my_role'
    end
    it "should not update role with an error" do
      put :update,  id: role, :role=>{name: 'my role'} 
      assigns[:role].name.should == 'my role'
      assigns[:role].errors[:name].should == ['Only letters, numbers, hyphens, underscores and periods are allowed']
      response.should be_successful
    end
  end

  describe "with a user who can remove roles" do
    before do
      ability.can :destroy, Role
    end

    it "should be able to destroy a role" do
      delete :destroy, id: role 
      response.should redirect_to @routes.url_helpers.roles_path
    end
  end

end
