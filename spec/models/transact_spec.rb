require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category1) { Category.first }
  subject do
    Transact.new(
      name: 'Electric bill',
      amount: 20.10,
      user: category1.user
    )
  end

  before { subject.save }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'validates presence of icon' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'Makes sure the amount in string is converted to number' do
    subject.amount = '10.20'
    expect(subject.amount).to be_a_kind_of(Numeric)
  end
end
