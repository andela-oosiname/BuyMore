require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'is valid  with valid  attributes' do
    expect(build(:product)).to be_valid
  end

  let(:product) { build(:product) }

  describe 'instance methods' do
    context 'respond to instance method calls' do
      it { expect(product).to respond_to(:name) }
      it { expect(product).to respond_to(:description) }
      it { expect(product).to respond_to(:image_url) }
      it { expect(product).to respond_to(:status) }
      it { expect(product).to respond_to(:price) }
    end
  end

  describe 'ActiveModel Validation' do
    it { expect(product).to validate_presence_of(:name) }
    it { expect(product).to validate_presence_of(:description) }
    it { expect(product).to validate_presence_of(:status) }
    it { expect(product).to validate_presence_of(:price) }
  end
end
