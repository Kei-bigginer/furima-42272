class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture 
  belongs_to :delivery_time

  belongs_to :user
  has_one_attached :image

  
  validates :nickname, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_time_id, presence: true
  validates :price, presence: true
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





end
