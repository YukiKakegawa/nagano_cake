class Item < ApplicationRecord
  attachment :image

  has_many :cart_items
  has_many :order_items
  belongs_to :genre
end
