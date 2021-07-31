module WorkOrdersHelper

  def order_details(work_order)
    if work_order
      content_tag(:p, work_order.location.name.concat(", #{work_order.location.city}")) +
      content_tag(:p, "$#{work_order.price}")
    end
  end
end