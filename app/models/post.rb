class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :breakfast_image
  has_one_attached :lunch_image
  has_one_attached :dinner_image

  serialize :breakfast, Array
  serialize :breakfast_calories, Array
  serialize :lunch, Array
  serialize :lunch_calories, Array
  serialize :dinner, Array
  serialize :dinner_calories, Array
  before_save :ensure_calorie_arrays

  # 朝食カロリー合計を取得
  def total_breakfast_calories
    (breakfast_calories || []).map(&:to_i).sum
  end

  # 昼食カロリー合計を取得
  def total_lunch_calories
    (lunch_calories || []).map(&:to_i).sum
  end

  # 夕食カロリー合計を取得
  def total_dinner_calories
    (dinner_calories || []).map(&:to_i).sum
  end

  # すべてのカロリーの合計
  def total_calorie_intake
    total_breakfast_calories + total_lunch_calories + total_dinner_calories
  end

  

  #新規投稿時のバリデーション
  validates :calorie_intake, :weight, :calories_consumed, presence: { message: 'は必須項目です。' }

  #投稿ごとの進捗率計算
  def index_progress
    ideal_weight = user.ideal_weight
    100 * (ideal_weight - (weight - ideal_weight).abs) / ideal_weight
  end

  def total_calories
    calories_consumed - calorie_intake
  end

  def favorited_by?(user)
    return false if user.nil?
    favorites.exists?(user_id: user.id)
  end

  private

  def ensure_calorie_arrays
    self.breakfast_calories ||= []
    self.lunch_calories ||= []
    self.dinner_calories ||= []
  end
end
