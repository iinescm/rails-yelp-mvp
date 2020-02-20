class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  #validates_associated :reviews

  validates :name, presence: true
  validates :category, inclusion: { in: %w(chinese italian japanese french belgian) }
  validates :address, :category, presence: true
end
