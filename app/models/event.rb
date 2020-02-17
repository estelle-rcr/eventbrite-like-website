class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :title, presence: true, length: { minimum: 5, maximum: 140 }
  validates :description, presence: true, length: { minimum: 20, maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1, less_than: 1000 }
  validates :location, presence: true

  validate :no_creation_in_the_past
  validate :no_edition_in_the_past
  validate :multiple_of_5

  belongs_to :admin, class_name: "User"

  def end_date
    return start_date + (duration * 60)
  end

  def is_past?(date)
    return date < Time.now
  end

  def no_creation_in_the_past
    errors.add(:start_date, "can't create an event in the past") if is_past?(start_date)
  end

  def no_edition_in_the_past
    errors.add(:duration, "can't edit a past event") if is_past?(end_date)
  end

  def multiple_of_5
    errors.add(:duration, "must be a multiple of 5") unless duration % 5 == 0
  end

end
