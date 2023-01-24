class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  
  validates :address, presence: true
  validates :shipping_cost, presence: true, numericality: true
  validates :total_payment, presence: true, numericality: true
  
  enum payment_method: {クレジットカード: 0, 銀行振込: 1}
  enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}
  
  
  scope :created_today, -> {where(created_at: Time.zone.now.all_day)}#今日の
end
