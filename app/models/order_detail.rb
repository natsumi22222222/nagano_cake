class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  belongs_to :item

  enum making_status: { not_possible: 0, waiting: 1, in_production: 2, completed: 3 }

end
