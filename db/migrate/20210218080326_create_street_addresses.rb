class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|
      t.string     :postal_code,     null: false
      t.integer    :area_id,         null: false
      t.string     :municipalities,  null: false
      t.string     :address,         null: false
      t.string     :place
      t.string     :tel,             null: false
      t.references :pay,             foreign_key: true
      t.timestamps
    end
  end
end
