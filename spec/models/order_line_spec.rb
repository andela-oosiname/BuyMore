require 'rails_helper'

RSpec.describe OrderLine, type: :model do
  it 'is valid  with valid  attributes' do
    expect(build(:order_line)).to be_valid
  end

  let(:order_line) { build(:order_line) }

  describe 'instance methods' do
    context 'respond to instance method calls' do
      it { expect(order_line).to respond_to(:qty) }
      it { expect(order_line).to respond_to(:product_id) }
      it { expect(order_line).to respond_to(:order_id) }
      it { expect(order_line).to respond_to(:total_price) }
      it { expect(order_line).to respond_to(:unit_price) }
    end
  end
end
