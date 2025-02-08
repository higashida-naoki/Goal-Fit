class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  #新規登録時のバリデーション
  validates :name, :nickname, :height, :current_weight, :ideal_weight, presence: { message: 'は必須項目です。' }
  #ユーザーステータスのバリデーション
  validates :is_active, inclusion: [true, false]

  #最新の投稿のweightをcurrent_weightに自動的に反映するために設定
  #投稿がなければ新規登録時に登録した体重(current_weight)が反映される
  def latest_weight
    posts.last&.weight || current_weight
  end

  #BMIの計算
  def bmi
    return nil if height == 0 # 身長が0の場合はBMIを計算しない
    weight_in_kg = latest_weight
    height_in_m = height / 100.0
    (weight_in_kg / (height_in_m ** 2)).round(2)
  end

  #適正体重の計算
  def ideal_weight_calculated
    return nil if height == 0  # 身長が0の場合は計算しない
    (height / 100.0) ** 2 * 22  # 身長の2乗 × 22（適正体重）
  end

  #理想体重と現在の体重の進捗度
  def progress
    (ideal_weight / latest_weight) * 100
  end
end
