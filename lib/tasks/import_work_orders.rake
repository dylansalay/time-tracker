
namespace :import_work_orders do
  desc "Import work orders from csv"
  task work_orders: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("spec", "fixtures", "work_orders.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      w = WorkOrder.new
      w.technician_id = row["technician_id"]
      w.location_id = row["location_id"]
      w.time = row["time"]
      w.duration = row["duration"]
      w.price = row["price"]
      w.save
      puts "#{w.technician_id}, #{w.location_id}, #{w.time}, #{w.duration}, #{w.price} saved"
    end
  end
end