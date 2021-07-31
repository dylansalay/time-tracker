class WorkOrdersController < ApplicationController
  before_action :load_technicians
  before_action :load_locations

  def index
    @work_orders = WorkOrder.all
  end

  private

  def load_technicians
    @technicians = Technician.all
  end

  def load_locations
    @locations = Location.all
  end
end