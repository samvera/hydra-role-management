
describe 'Routes for role_management', type: :routing do
  routes { Hydra::RoleManagement::Engine.routes }

  context 'when using the default engine routes' do
    it 'routes to the index action' do
      expect(get: '/roles').to route_to(controller: 'roles', action: 'index')
    end
    it 'routes create action' do
      expect(post: '/roles').to route_to(controller: 'roles', action: 'create')
    end
    it 'routes to the show action' do
      expect(get: '/roles/7').to route_to(controller: 'roles', action: 'show', id: '7')
    end
    it 'routes to the create action for creating a new user' do
      expect(post: '/roles/7/users').to route_to(controller: 'user_roles', role_id: '7', action: 'create')
    end
    it 'routes to the delete action for deleting an existing user' do
      expect(delete: '/roles/7/users/5').to route_to(controller: 'user_roles', role_id: '7', id: '5', action: 'destroy')
    end
  end

  context 'when customizing the engine routes' do
    before do
      routes.draw { Hydra::RoleManagement.draw_routes(self, path: '/admin/groups') }
      Rails.application.reload_routes!
    end

    it 'routes to the index action' do
      expect(get: '/admin/groups').to route_to(controller: 'roles', action: 'index')
    end
    it 'routes create action' do
      expect(post: '/admin/groups').to route_to(controller: 'roles', action: 'create')
    end
    it 'routes to the show action' do
      expect(get: '/admin/groups/7').to route_to(controller: 'roles', action: 'show', id: '7')
    end
    it 'routes to the create action for creating a new user' do
      expect(post: '/admin/groups/7/users').to route_to(controller: 'user_roles', role_id: '7', action: 'create')
    end
    it 'routes to the delete action for deleting an existing user' do
      expect(delete: '/admin/groups/7/users/5').to route_to(controller: 'user_roles', role_id: '7', id: '5', action: 'destroy')
    end
  end
end
