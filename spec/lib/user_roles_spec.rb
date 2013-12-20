require 'spec_helper'

describe Hydra::RoleManagement::UserRoles do
  let(:librarian) { Role.create!(name: 'librarian') }
  describe "a real user" do
    subject do
      User.create!(email: 'fred@example.com', password: 'password')
    end

    it "should have admin?" do
      subject.should_not be_admin
    end

    describe "with roles" do
      before do
        subject.roles << librarian
      end

      its(:roles) { should eq [librarian] }
      its(:groups) { should include('registered', 'librarian') }
    end
  end

  describe "when DeviseGuests is installed" do
    before do
      stub_const("DeviseGuests", true)
    end

    describe "a real user" do
      subject do
        User.create!(email: 'fred@example.com', password: 'password')
      end

      it { should_not be_admin }

      describe "with roles" do
        before do
          subject.roles << librarian
        end

        its(:groups) { should include('registered', 'librarian') }
      end
    end
    describe "a guest user" do
      subject do
        User.create!(email: 'fred@example.com', password: 'password', guest: true)
      end

      it { should_not be_admin }
      its(:groups) { should be_empty }
    end
  end

end
