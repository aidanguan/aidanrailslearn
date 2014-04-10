class Seat < ActiveRecord::Base
  belongs_to :flight
  before_validation :validate_baggage
  def validate_baggage
    Rails.logger.info baggage
    Rails.logger.info flight.baggage_allowance
    if baggage > flight.baggage_allowance
      self.errors.add(:baggage, "you have too much baggage")
      Rails.logger.info errors.inspect
    end
  end
end
