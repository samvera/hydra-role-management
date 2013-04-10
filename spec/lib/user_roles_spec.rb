require 'spec_helper'

describe Hydra::RoleManagement::UserRoles do
  subject do
    User.create!(email: 'fred@example.com', password: 'password')
  end

  it "should have admin?" do
    subject.should_not be_admin
  end

  it "should have roles" do
    subject.roles.should == []
    subject.roles << Role.create!(name: 'librarian')
    subject.roles.first.name.should == 'librarian'

  end

  it "should have groups" do
    subject.roles.should == []
    subject.roles << Role.create!(name: 'librarian')
    subject.save!
    subject.groups.should include('registered', 'librarian')
  end

end
