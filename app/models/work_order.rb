class WorkOrder < ApplicationRecord
  belongs_to :technician
  belongs_to :location
  belongs_to :schedule

  TIMES = ['6:00', '7:00', '8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00'].freeze

  def order_location
    return self.location.name + ', ' + self.location.city
  end

  def end_time
    (Time.parse(self.time) + (self.duration * 60)).strftime("%I:%M")
  end
end
