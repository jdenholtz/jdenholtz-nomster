class Place < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :photos, dependent: :destroy

  
  geocoded_by :address
  after_validation :geocode

  
  validates :name, :address, :description, presence: true
  validates :name, length: { minimum: 4, too_short: "must be longer than 3 characters"}
end
