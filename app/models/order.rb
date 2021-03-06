class Order < ActiveRecord::Base
  has_many :order_lines, dependent: :destroy
  belongs_to :customer

  accepts_nested_attributes_for :order_lines, allow_destroy: true
end
