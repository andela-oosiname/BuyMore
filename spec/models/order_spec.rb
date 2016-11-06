require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'is valid  with valid  attributes' do
    expect(build(:order)).to be_valid
  end

  let(:order) { build(:order) }

  describe 'instance methods' do
    context 'respond to instance method calls' do
      it { expect(order).to respond_to(:order_no) }
      it { expect(order).to respond_to(:customer_id) }
      it { expect(order).to respond_to(:total) }
      it { expect(order).to respond_to(:date) }
    end
  end
end
