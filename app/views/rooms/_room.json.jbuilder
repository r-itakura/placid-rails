json.extract! room, :id, :hotel_id, :plan_id, :room_no, :smoke_flag, :bed_type, :usable_flag, :maximum_capacity, :created_at, :updated_at
json.url room_url(room, format: :json)
