class Item < ApplicationRecord
  enum is_active:{ 販売中: 0, 販売停止中: 1 }
  belongs_to :admin_user
  attachment :image
end
