class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  belongs_to :item


  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end

  def subtotal
      item.with_tax_price * amount
  end





end
