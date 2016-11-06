require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid  with valid  attributes' do
    expect(build(:customer)).to be_valid
  end

  let(:customer) { build(:customer) }

  describe 'instance methods' do
    context 'respond to instance method calls' do
      it { expect(customer).to respond_to(:firstname) }
      it { expect(customer).to respond_to(:lastname) }
      it { expect(customer).to respond_to(:email) }
      it { expect(customer).to respond_to(:password) }
    end
  end

  describe 'ActiveModel Validation' do
    it { expect(customer).to validate_presence_of(:firstname) }
    it { expect(customer).to validate_presence_of(:lastname) }
    it { expect(customer).to validate_presence_of(:email) }
    it { expect(customer).to validate_presence_of(:password) }
    it { expect(customer).to validate_length_of(:password).is_at_least(7) }
  end
end
