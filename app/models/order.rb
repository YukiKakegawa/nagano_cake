class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_items, dependent: :destroy

  enum payment_method: {銀行振込:0, クレジットカード:1}
  enum status: {入金待ち:0, 入金確認:1, 製作中:2, 発送準備中:3, 発送済:4}

  def sum
   sum = 0
   self.order_items.each do |order_item|
   sum += order_item.item.price * order_item.amount

   end
   return sum
  end


end
