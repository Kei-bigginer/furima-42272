class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    #  カード情報未入力時のエラー
    # validates :token, message: "can't be blank"
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only numbers' }
  end
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :phone_number, length: { 
     minimum: 10, 
      message: 'is too short' 
    }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number,
      order_id: order.id  
    )
  end


end