class Order < ApplicationRecord
  enum status: {
    入金待ち: '入金待ち',
    入金確認: '入金確認',
    製作中: '製作中',
    発送準備中: '発送準備中',
    発送済み: '発送済み'
  }

  enum payment_method: {
    クレジットカード: 'クレジットカード',
    銀行振込: '銀行振込'
  }
end