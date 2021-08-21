class WorkOrder < ApplicationRecord
  belongs_to :technician
  belongs_to :location
  belongs_to :schedule

  TIMES = ['06:00', '07:00', '08:00', '09:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00']

  def scheduled_time
    self.time.beginning_of_hour.strftime("%H:%M")
  end

  def order_location
    return self.location.name + ', ' + self.location.city
  end
end
