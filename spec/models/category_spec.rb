require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user1) { User.first }
  subject do
    Category.new(
      name: 'Expenses',
      icon: 'url',
      user: user1
    )
  end

  before { subject.save }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'Makes sure the icon is a string' do
    subject.icon = 'url.com'
    expect(subject.icon).to be_a(String)
  end
end
