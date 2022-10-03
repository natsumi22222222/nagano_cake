class Order < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum payment_method: { waiting: 0, confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }

end
