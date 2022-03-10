class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :email,              null: false, default: ""
      t.text :text, null: false
      t.integer :genre_id, null: false
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
