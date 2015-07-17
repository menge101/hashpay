class HashKennel < ActiveRecord::Base
  has_many :events
  validates :abbreviation, uniqueness: true
end