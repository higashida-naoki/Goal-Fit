class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  #新規登録時のバリデーション
  validates :name, :nickname, :current_weight, :ideal_weight, presence: { message: 'は必須項目です。' }
  #ユーザーステータスのバリデーション
  validates :is_active, inclusion: [true, false]
end
