class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_insensitive: true }

  has_many :events, foreign_key: :creator_id
  has_many :attendings, foreign_key: :attendee_id
  has_many :attended_events, through: :attendings, source: :attended_event

  def upcoming_events
    attended_events.where('date >= ?', Date.today)
  end

  def previous_events
    attended_events.where('date < ?', Date.today)
  end
end
