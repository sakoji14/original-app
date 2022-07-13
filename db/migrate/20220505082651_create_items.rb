class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,             null: false
      t.integer :category_id,         null: false
      t.integer :delivery_method_id,  null: false
      t.string  :fee,             null: false
      t.integer :shipping_date_id,    null: false
      t.string  :contents,                 null: false
      t.text    :comment,             null: false
      t.references :owner, null: false,  foreign_key: true
      t.timestamps
    end
  end
end