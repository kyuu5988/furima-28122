class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :order   , null: false, foreign_key: true
      t.string :post        , null: false
      t.integer :pref_id    , null: false
      t.string :city        , null: false
      t.string :area        , null: false
      t.string :bld        
      t.string :phone       , null: false
      t.timestamps
    end
  end
end
