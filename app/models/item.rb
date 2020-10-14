class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ctg, :de_are, :de_day, :de_fee, :status

  validates :p_name, :p_info, :ctg, :de_are, :de_day, :de_fee, :status, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :ctg_id, :de_are_id, :de_day_id, :de_fee_id, :status_id, numericality: { other_than: 1 }
end
