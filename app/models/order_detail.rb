class OrderDetail < ApplicationRecord
  enum making_status: {
    製作不可: '製作不可',
    製作待ち: '製作待ち',
    製作中: '製作中',
    製作完了: '製作完了'
  }
end
