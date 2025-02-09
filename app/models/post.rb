class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  #新規投稿時のバリデーション
  validates :calorie_intake, :weight, :calories_consumed, presence: { message: 'は必須項目です。' }

  #投稿ごとの進捗率計算
  def index_progress
    ideal_weight = user.ideal_weight
    100 * (ideal_weight - (weight - ideal_weight).abs) / ideal_weight
  end

end
