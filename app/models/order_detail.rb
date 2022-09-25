class OrderDetail < ApplicationRecord
  belonds_to :order, dependent: :destroy
  belonds_to :item
end
