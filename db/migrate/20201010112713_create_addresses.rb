class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postalcode,    null: false
      t.integer :area_id ,    null: false
      t.string :housenumber,  null: false
      t.string :building,     null: false
      t.string :telephone,    null: false
      t.references :order,null: false,foreign_key: true
      t.timestamps
    end
  end
end
