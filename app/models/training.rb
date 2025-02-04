class Training < ApplicationRecord
  validates :training_name, presence: true
  validates :introduction, presence: true

  has_many :posts, dependent: :destroy
  has_one_attached :image
  belongs_to :genre
end
