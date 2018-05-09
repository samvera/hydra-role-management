# frozen_string_literal: true
describe Role do
  subject(:role) { described_class.new }
  it 'requires a name' do
    expect(role).not_to be_valid
    role.name = 'foo'
    expect(role).to be_valid
  end

  it 'does not allow space in the name' do
    role.name = 'foo bar'
    expect(role).not_to be_valid
  end

  it 'does not allow comma in the name' do
    role.name = 'foo,bar'
    expect(role).not_to be_valid
  end

  it 'does not allow ampersand in the name' do
    role.name = 'foo&bar'
    expect(role).not_to be_valid
  end

  it 'does not allow less-than in the name' do
    role.name = 'foo<bar'
    expect(role).not_to be_valid
  end

  it 'validates uniqueness' do
    role.name = 'foo'
    role.save!
    expect(described_class.new(name: 'foo')).not_to be_valid
  end
end
