class CreateOmises < ActiveRecord::Migration[6.0]
  def change
    create_table :omises do |t|

      t.timestamps
    end
  end
end
