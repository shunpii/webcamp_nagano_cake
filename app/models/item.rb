class Item < ApplicationRecord
  enum is_active:{ 販売中: 1, 販売停止中: 2 }
  belongs_to :genre
  attachment :image
end
