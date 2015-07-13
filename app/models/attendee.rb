class Attendee < ActiveRecord::Base
  belongs_to :event
  validates :name, presence: true
  validates :email, presence: true
  validates :event, presence: true
end