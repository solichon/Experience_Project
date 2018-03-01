class Activity < ApplicationRecord
  belongs_to :user

  mount_uploader :image, PhotoUploader

  monetize :adult_price_cents
  monetize :child_price_cents

  enum active: [:inactive, :active, :archived]

  validates :title, presence: true
  validates :capacity, presence: true, numericality: true
  validates :duration_in_minutes, presence: true, numericality: true
  validates :active, presence: true
  validates :user, presence: true
end
