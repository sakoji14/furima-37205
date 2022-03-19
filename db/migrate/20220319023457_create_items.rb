class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string :nickname,             null: false
      t.integer :category_id,         null: false
      t.integer :qualitu_id,          null: false
      t.integer :delivery_charge_id,  null: false
      t.integer :pref_id,             null: false
      t.integer :shipping_date_id,    null: false
      t.integer :fee,                 null: false
      t.text    :messages,            null: false
      t.timestamps
    end
  end
end
