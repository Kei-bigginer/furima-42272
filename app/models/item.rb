class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture 
  belongs_to :delivery_time

  belongs_to :user
  has_one_attached :image

  validate :image_presence

  validates :name, presence: true
  validates :description, presence: true

  validates :price, presence: true
  validates :price, numericality: {
     only_integer: true, 
     greater_than_or_equal_to: 300 ,
     less_than_or_equal_to: 9999999,
    message: ":価格は、¥300~¥9,999,999の間で指定してください"	},
    format: {with: /\A[0-9]+\z/, message:":半角数字で入力してください" }


  validates :user, presence: true

  validates :category_id, numericality: { 
    other_than: 1 , 
    message: "can't be blank" 
  } 

  validates :condition_id, numericality: { 
    other_than: 1 , 
    message: "can't be blank" 
  } 

  validates :shipping_fee_id, numericality: { 
    other_than: 1 , 
    message: "can't be blank" 
  } 

  validates :prefecture_id, numericality: { 
    other_than: 1 , 
    message: "can't be blank" 
  } 

  validates :delivery_time_id, numericality: { 
    other_than: 1 , 
    message: "can't be blank" 
  } 

  private

  def image_presence
    unless image.attached?
      errors.add(:image, "can't be blank")
    end
  end 
end
