class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string       :product＿name         , null: false 
      t.text         :product＿info         , null: false 
      t.integer      :category_id           , null: false 
      t.integer      :product_condition_id  , null: false 
      t.integer      :shipping_charge_id    , null: false 
      t.integer      :prefecture_id         , null: false 
      t.integer      :day_to_ship_id        , null: false 
      t.integer      :price                 , null: false 
      t.references   :user                  , foreign_key: true  
      t.timestamps                    
    end
  end
end