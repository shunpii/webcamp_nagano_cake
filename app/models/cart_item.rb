class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def subtotal
    self.item.price * self.amount
  end

end
