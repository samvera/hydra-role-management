# frozen_string_literal: true
describe Hydra::RoleManagement::UserRoles do
  let(:librarian) { Role.create!(name: 'librarian') }
  describe 'a real user' do
    subject(:user) do
      User.create!(email: 'fred@example.com', password: 'password')
    end

    it 'has admin?' do
      expect(user).not_to be_admin
    end

    describe 'with roles' do
      before do
        user.roles << librarian
      end

      its(:roles) { is_expected.to eq [librarian] }
      its(:groups) { is_expected.to include('registered', 'librarian') }
    end
  end

  describe 'when DeviseGuests is installed' do
    before do
      stub_const('DeviseGuests', true)
    end

    describe 'a real user' do
      subject(:user) do
        User.create!(email: 'fred@example.com', password: 'password')
      end

      it { is_expected.not_to be_admin }

      describe 'with roles' do
        before do
          user.roles << librarian
        end

        its(:groups) { is_expected.to include('registered', 'librarian') }
      end
    end
    describe 'a guest user' do
      subject(:user) do
        User.create!(email: 'fred@example.com', password: 'password', guest: true)
      end

      it { is_expected.not_to be_admin }
      its(:groups) { is_expected.to be_empty }
    end
  end
end
