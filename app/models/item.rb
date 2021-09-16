class Item < ApplicationRecord
  enum is_active:{ 販売中: '販売中', 販売停止中: '販売停止中' }
  belongs_to :genre
  attachment :image
end
