class Journey < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates :start_destination, presence: true
  validates :end_destination, presence: true
end
