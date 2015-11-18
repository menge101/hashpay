class Kennel < ActiveRecord::Base
  has_many :events
  validates :full_name, uniqueness: true, presence: true
  validates :abbreviation, presence: true
end