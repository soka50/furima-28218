class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :day_to_ship

  with_options presence: true do
    validates :product＿name 
    validates :product＿info
    validates :price   
    validates :user  
    validates :category
    validates :product_condition
    validates :shipping_charge
    validates :prefecture
    validates :day_to_ship
  end

  
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :product_condition_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :day_to_ship_id
  end
                 
end
