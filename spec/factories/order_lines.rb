FactoryGirl.define do
  factory :order_line do
    order factory: :order
    product factory: :product
    qty Faker::Number.between(1, 10)
    total_price Faker::Commerce.price
    unit_price Faker::Commerce.price
  end
end
