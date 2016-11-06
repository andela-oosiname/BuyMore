FactoryGirl.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Hipster.sentence }
    price { Faker::Commerce.price }
    status { [0, 1].sample }
  end
end
