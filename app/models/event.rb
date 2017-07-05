class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum: 128 }
  validates :description, :date, :location, presence: true

  belongs_to :creator, class_name: 'User'
  has_many :attendings, foreign_key: :attended_event_id
  has_many :attendees, through: :attendings, source: :attendee

  scope :upcoming, -> { where('date >= ?', Date.today) }
  scope :past, -> { where('date < ?', Date.today) }
  scope :today, -> { where(date: Date.today)}
  default_scope { order(created_at: :desc) }
end
