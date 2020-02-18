class Attendance < ApplicationRecord
  after_create :new_attending_send

  validates :stripe_customer_id, presence: true
  belongs_to :attendee, class_name: "User"
  belongs_to :event
  validates_associated :event

  def new_attending_send
    AttendanceMailer.new_attending_email(self).deliver_now
  end
end
