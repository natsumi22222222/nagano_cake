class CartItem < ApplicationRecord
  belonds_to :customer
  belonds_to :item

end
