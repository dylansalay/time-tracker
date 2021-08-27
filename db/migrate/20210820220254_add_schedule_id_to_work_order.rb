class AddScheduleIdToWorkOrder < ActiveRecord::Migration[6.0]
  def change
    add_reference :work_orders, :schedule, index: true
  end
end
