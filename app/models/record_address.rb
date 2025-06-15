class RecordAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :record_id,:token
  validates :user_id,         presence: true
  validates :item_id,         presence: true  
  validates :post_number,     presence: true
  validates :prefecture_id,   numericality: { other_than: 1 }
  validates :city,            presence: true
  validates :house_number,    presence: true
  validates :phone_number,    presence: true
  validates :token,           presence: true

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number)
  end
end