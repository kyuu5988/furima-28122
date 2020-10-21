class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :ctg
  belongs_to_active_hash :de_are
  belongs_to_active_hash :de_fee
  belongs_to_active_hash :de_day
  belongs_to_active_hash :status

  has_one_attached :image

  validate :image_checker, :size_checker

  def image_checker
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'jpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, '画像は必ず添付してください')
    end
  end

  def size_checker
    if image.attached?
      if image.blob.byte_size > 8.megabytes
        errors.add(:image, 'ファイルは8MB未満にして下さい')
      end
    end
  end

  belongs_to :user
  has_one :order

  validates :p_name, :p_info, :ctg, :de_are, :de_day, :de_fee, :status, presence: true

  validates :ctg_id, :de_are_id, :de_day_id, :de_fee_id, :status_id, numericality: { other_than: 1 }

  validates :price, presence: true, 
            numericality: {
              greater_than_or_equal_to: 300,
              less_than_or_equal_to: 9999999,
              message: '指定の範囲で半角数字で入力して下さい。' 
           }
end
