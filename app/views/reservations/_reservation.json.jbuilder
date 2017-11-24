json.extract! reservation, :id, :hotel_id, :guest_id, :plan_id, :guest_num, :reserve_date, :reserve_date_num, :price, :cancel_flag, :room_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
