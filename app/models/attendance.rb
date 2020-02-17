class Attendance < ApplicationRecord
  validates :stripe_customer_id, presence: true
  belongs_to :attendee, class_name: "User"
  belongs_to :event
  validates_associated :event
end
