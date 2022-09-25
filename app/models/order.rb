class Order < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :customer
end
