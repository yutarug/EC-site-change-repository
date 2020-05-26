class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :address
      t.string :street_address
      t.string :postal_code
      t.integer :total_fee
      t.boolean :payment_method
      t.integer :order_status,default:0,null:false,limit:1
      t.integer :postage
      t.timestamps
    end
  end
end
