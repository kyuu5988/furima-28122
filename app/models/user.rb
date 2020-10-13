class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  with_options presence: true, format: { with:/\A.+\z/, message: '必ず入力して下さい' } do
    validates :nickname
    validates :b_day
  end

  with_options presence: true, format: { with:/\A[^@\s]+@[^@\s]+\z/, message: '@を含めて必ず入力して下さい' } do
    validates :email
  end





  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: '英字と数字を含めて入力して下さい'

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください' } do
    validates :last_kana
    validates :first_kana
  end


end

