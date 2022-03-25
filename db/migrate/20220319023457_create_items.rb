class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string  :nickname,             null: false
      t.integer :category_id,         null: false
      t.integer :quality_id,          null: false
      t.integer :delivery_charge_id,  null: false
      t.integer :pref_id,             null: false
      t.integer :shipping_date_id,    null: false
      t.integer :fee,                 null: false
      t.text    :message,             null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
