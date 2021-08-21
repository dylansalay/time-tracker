class SchedulesController < ApplicationController
  before_action :load_schedule, only: [:show]
  before_action :load_technicians, only: [:show]

  def index
    @schedules = Schedule.all
  end

  def show
    @work_orders = @schedule.work_orders
  end

  private

  def load_schedule
    @schedule = Schedule.find_by(id: params[:id])
  end

  def load_technicians
    @technicians = Technician.all
  end
end