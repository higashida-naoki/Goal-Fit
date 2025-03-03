class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :breakfast_image
  has_one_attached :lunch_image
  has_one_attached :dinner_image
  has_many :tags, dependent: :destroy

  #新規投稿時のバリデーション
  validates :breakfast, :breakfast_calories, :lunch, :lunch_calories, :dinner, :dinner_calories, :weight, presence: { message: 'は必須項目です。' }

  # すべてのカロリーの合計
  def total_calories_intake
    breakfast_calories.to_i + lunch_calories.to_i + dinner_calories.to_i
  end

  #投稿ごとの進捗率計算
  def index_progress
    ideal_weight = user.ideal_weight
    100 * (ideal_weight - (weight - ideal_weight).abs) / ideal_weight
  end

  def total_calories
    calories_consumed - total_calories_intake
  end

  def favorited_by?(user)
    return false if user.nil?
    favorites.exists?(user_id: user.id)
  end

  private
end
