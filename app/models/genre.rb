class Genre < ApplicationRecord
  validates :name, presence: true
  has_many :trainings, dependent: :destroy
end
