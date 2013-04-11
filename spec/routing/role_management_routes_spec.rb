require 'spec_helper'

describe "Routes for role_management" do
  before(:each) do
    @routes = Hydra::RoleManagement::Engine.routes 
    # so we have to do this instead:
    # engine routes broke in rspec rails 2.12.1, so we had to add this:
    assertion_instance.instance_variable_set(:@routes, @routes)
  end
  it "should route index" do 
    { :get => '/roles' }.should route_to( :controller => "roles", :action => "index")
  end
  it "should create roles" do 
    { :post => '/roles' }.should route_to( :controller => "roles", :action => "create")
  end
  it "should show roles" do 
    { :get => '/roles/7' }.should route_to( :controller => "roles", :action => "show", :id => '7')
  end
  it "should add users" do 
    { :post => '/roles/7/users' }.should route_to( :controller => "user_roles", :role_id=>'7', :action => "create")
  end
  it "should remove users" do 
    { :delete => '/roles/7/users/5' }.should route_to( :controller => "user_roles", :role_id=>'7', :id=>'5', :action => "destroy")
  end
end
