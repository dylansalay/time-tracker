class WorkOrdersController < ApplicationController
  before_action :load_schedule

  def new
    @work_order = WorkOrder.new
  end

  def create 
    @work_order = @schedule.work_orders.build(work_order_params)
    technician = Technician.find_by_id(work_order_params[:technician_id])
    
    respond_to do |format|
      if technician.is_busy?(@work_order)
        byebug
        format.html { redirect_to schedule_path(@schedule), notice: 'Technician has another work order scheduled at this time' }
        format.json { render :show, status: :created, location: @work_order }
      elsif @work_order.save
        format.html { redirect_to @schedule, notice: 'Work Order was successfully created.' }
        format.json { render :show, status: :created, location: @work_order }
      else
        format.html { render :new }
        format.json { render json: @work_order.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def load_schedule
    @schedule = Schedule.find_by_id(params[:schedule_id])
    raise ActionController::RoutingError.new('Not Found') if @schedule.blank?
  end

  def work_order_params
    params.require(:work_order).permit(:duration, :price, :date, :time, :location_id, :schedule_id, :technician_id)
  end
end