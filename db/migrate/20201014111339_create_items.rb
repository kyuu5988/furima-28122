class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user       , null: false, foreign_key: true
      t.string     :p_name     , null: false
      t.text       :p_info     , null: false
      t.integer    :ctg_id     , null: false
      t.integer    :status_id  , null: false
      t.integer    :de_fee_id  , null: false
      t.integer    :de_are_id  , null: false
      t.integer    :de_day_id  , null: false
      t.integer    :price      , null: false
      t.boolean    :sold       , null: false
      t.timestamps
    end
  end
end
