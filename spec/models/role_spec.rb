require 'spec_helper'

describe Role do
  it "should require a name" do
    expect(subject).not_to be_valid
    subject.name = 'foo'
    expect(subject).to be_valid
  end

  it "should not allow space in the name" do
    subject.name = 'foo bar'
    expect(subject).not_to be_valid
  end

  it "should not allow comma in the name" do
    subject.name = 'foo,bar'
    expect(subject).not_to be_valid
  end

  it "should not allow ampersand in the name" do
    subject.name = 'foo&bar'
    expect(subject).not_to be_valid
  end

  it "should not allow less-than in the name" do
    subject.name = 'foo<bar'
    expect(subject).not_to be_valid
  end

  it "should validate uniqueness" do
    subject.name ='foo'
    subject.save!
    expect(Role.new(name: 'foo')).not_to be_valid
  end
end
