class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  enum status: {
    入金待ち: '入金待ち',
    入金確認: '入金確認',
    製作中: '製作中',
    発送準備中: '発送準備中',
    発送済み: '発送済み'
  }

  enum payment_method: {
    credit_card: 0,
    bunk: 1
  }

  enum address: {
    customer_address: 0,
    addresses: 1,
    new_address: 2
  }
end