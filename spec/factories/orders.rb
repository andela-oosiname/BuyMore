FactoryGirl.define do
  factory :order do
    order_no { SecureRandom.hex(8) }
    customer factory: :customer
    total Faker::Commerce.price
    date DateTime.now
  end
end
