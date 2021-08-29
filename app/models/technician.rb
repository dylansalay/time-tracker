class Technician < ApplicationRecord
  has_many :work_orders
  has_many :locations, through: :work_orders

  def work_order(time)
    work_order = self.work_orders.select{ |wo| wo.time == time }.first
  end

  def is_busy?(new_work_order)
    self.work_orders.where(date: new_work_order.date).each do |wo|
      x = (Time.parse(wo.time)...Time.parse(wo.end_time)).overlaps?(Time.parse(new_work_order.time)...Time.parse(new_work_order.end_time))

      return true if x == true
    end

    return false
  end
end
