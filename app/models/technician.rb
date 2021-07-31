class Technician < ApplicationRecord
  has_many :work_orders
  has_many :locations, through: :work_orders

  def work_order(time)
    work_order = self.work_orders.select{ |wo| wo.scheduled_time == time }.first
  end
end
