class Post < ApplicationRecord

  belongs_to :training
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
end
