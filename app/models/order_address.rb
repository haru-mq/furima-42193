class OrderAddress
  include ActiveModel::Model

  attr_accessor :user_id, :item_id, :post_number, :prefecture_id, :city, :house_number, :building, :phone_number, :record_id, :token
 
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :city
    validates :house_number
    validates :token
    validates :post_number,     format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Input correctly.'}
    validates :phone_number,    format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid. Input only numbers.'}
  end

    validates :prefecture_id,   numericality: { other_than: 1 }

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city: city, house_number: house_number, building: building, phone_number: phone_number, record_id: record.id)
  end
end