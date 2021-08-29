module WorkOrdersHelper

  def order_details(work_order)
    if work_order
      content_tag(:p, "Location: #{work_order.order_location}") +
      content_tag(:p, "Start Time: #{work_order.time}") +
      content_tag(:p, "Cost: $#{work_order.price}")
    end
  end
end