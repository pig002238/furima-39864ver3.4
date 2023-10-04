class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_history
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery_time


  validates :item, presence: true
  validates :item_description, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_time_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :user, presence: true
  validates :image, presence: true
  
end

