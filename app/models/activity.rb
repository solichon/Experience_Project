class Activity < ApplicationRecord
  belongs_to :user
  has_many :timeslots, dependent: :nullify # custom TBD for archive

  # mount_uploader :image, PhotoUploader # to be uncommented when cloudinary key available

  monetize :adult_price_cents
  monetize :child_price_cents

  enum status: [:active, :inactive, :archived]

  validates :title, presence: true
  validates :capacity, presence: true, numericality: true
  validates :duration_in_minutes, presence: true, numericality: true
  validates :status, presence: true
end
