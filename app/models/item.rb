class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ctg
  belongs_to_active_hash :de_are
  belongs_to_active_hash :de_fee
  belongs_to_active_hash :de_day
  belongs_to_active_hash :status

  belongs_to :user
  # has_one :order

  validates :p_name, :p_info, :ctg, :de_are, :de_day, :de_fee, :status, presence: true

  validates :ctg_id, :de_are_id, :de_day_id, :de_fee_id, :status_id, numericality: { other_than: 1 }
end
