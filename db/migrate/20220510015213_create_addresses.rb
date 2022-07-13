class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post_number,  null: false
      t.integer :pref_id, null: false
      t.string :city, null: false
      t.string :mail, null: false
      t.string :build
      t.string :tell, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
