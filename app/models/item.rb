class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :ship_date

  belongs_to :user
  has_one    :record
  has_one_attached :image

  validates :item_name,         presence: true
  validates :item_description,  presence: true
  validates :category_id,       numericality: { other_than: 1 }
  validates :condition_id,      numericality: { other_than: 1 }
  validates :fee_id,            numericality: { other_than: 1 }
  validates :prefecture_id,     numericality: { other_than: 1 }
  validates :ship_date_id,      numericality: { other_than: 1 }
  validates :price,             numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :image,             presence: true

end
