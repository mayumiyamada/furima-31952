class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token


with_options presence: true do
  validates :token
  validates :city	
  validates :address
  validates :phone_number
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
end
  
  validates :prefecture_id, presence: true, numericality: { other_than: 0, message: "Select" }
  validates :phone_number, format: { with: /\A0\d{,11}$\z/, message: "No hyphen(-)& less than 11"}


def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number:phone_number,order:order)
 end
end

  