class AddScheduleIdToWorkOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :work_orders, :schedule_id, :integer
  end
end
