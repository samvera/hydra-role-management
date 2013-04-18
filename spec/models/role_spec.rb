require 'spec_helper'

describe Role do
  it "should require a name" do
    subject.should_not be_valid
    subject.name = 'foo'
    subject.should be_valid
  end

  it "should not allow space in the name" do
    subject.name = 'foo bar'
    subject.should_not be_valid
  end

  it "should not allow comma in the name" do
    subject.name = 'foo,bar'
    subject.should_not be_valid
  end

  it "should not allow ampersand in the name" do
    subject.name = 'foo&bar'
    subject.should_not be_valid
  end

  it "should not allow less-than in the name" do
    subject.name = 'foo<bar'
    subject.should_not be_valid
  end

  it "should validate uniqueness" do
    subject.name ='foo'
    subject.save!
    Role.new(name: 'foo').should_not be_valid
  end
end
