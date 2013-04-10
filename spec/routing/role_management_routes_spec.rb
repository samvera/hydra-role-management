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
  # it "should route edit" do 
  #   { :get => edit_batch_edits_path }.should route_to( :controller => "batch_edits", :action => "edit")
  # end
  # it "should route update" do 
  #   { :put => batch_edits_path }.should route_to( :controller => "batch_edits", :action => "update")
  # end
  # it "should route delete batch" do 
  #   { :delete => batch_edits_path }.should route_to( :controller => "batch_edits", :action => "destroy_collection")
  # end
  # it "should route add" do 
  #   { :put => '/batch_edits/7'}.should route_to( :controller => "batch_edits", :action => "add", :id=>'7')
  # end
  # it "should route delete" do 
  #   { :delete => '/batch_edits/7' }.should route_to( :controller => "batch_edits", :action => "destroy", :id=>'7')
  #   batch_edit_path(7).should == "/batch_edits/7"
  # end

  # it "should route all" do 
  #   { :put => '/batch_edits/all'}.should route_to( :controller => "batch_edits", :action => "all")
  #   all_batch_edits_path.should == "/batch_edits/all"
  # end


end
