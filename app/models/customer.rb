class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
         
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :address, dependent: :destroy
  
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postal_code, presence: true, length: {maximum: 7, minimum: 7}, numbericality: true
  validates :address, presence: true
  validates :telephone_number, presence: true, length: {maximum: 11, minimum: 11}, numbericality: true
  
  def name
    first_name + last_name
  end
  
  def address
    postal_code + address + name
  end
  
end
