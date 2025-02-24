class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ログイン時に is_active が false なら拒否
  def active_for_authentication?
    super && is_active?
  end
  
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_one_attached :image
  # 自分がフォローされる（被フォロー）側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 被フォロー関係を通じて参照→自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 自分がフォローする（与フォロー）側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 与フォロー関係を通じて参照→自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed

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

  #理想体重と現在の体重を比較した進捗率
  def progress
    100 * (ideal_weight - (latest_weight - ideal_weight).abs) / ideal_weight
  end

  def get_profile_image
    (image.attached?) ? image : 'no_image.jpg'
  end

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(nickname: content)
    elsif method == 'forward'
      User.where('nickname LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('nickname LIKE ?', '%' + content)
    else
      User.where('nickname LIKE ?', '%' + content + '%')
    end
  end

  #ゲストログインの設定
  GUEST_USER_EMAIL = "guest@example.com"
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  def guest_user?
    email == GUEST_USER_EMAIL
  end

  #フォロー・フォロワーの設定
  def follow(user)
    relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    relationships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
  
end
