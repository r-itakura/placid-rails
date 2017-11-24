require 'test_helper'

class ReservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservation = reservations(:one)
  end

  test "should get index" do
    get reservations_url
    assert_response :success
  end

  test "should get new" do
    get new_reservation_url
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post reservations_url, params: { reservation: { cancel_flag: @reservation.cancel_flag, guest_id: @reservation.guest_id, guest_num: @reservation.guest_num, hotel_id: @reservation.hotel_id, plan_id: @reservation.plan_id, price: @reservation.price, reserve_date: @reservation.reserve_date, reserve_date_num: @reservation.reserve_date_num, room_id: @reservation.room_id } }
    end

    assert_redirected_to reservation_url(Reservation.last)
  end

  test "should show reservation" do
    get reservation_url(@reservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservation_url(@reservation)
    assert_response :success
  end

  test "should update reservation" do
    patch reservation_url(@reservation), params: { reservation: { cancel_flag: @reservation.cancel_flag, guest_id: @reservation.guest_id, guest_num: @reservation.guest_num, hotel_id: @reservation.hotel_id, plan_id: @reservation.plan_id, price: @reservation.price, reserve_date: @reservation.reserve_date, reserve_date_num: @reservation.reserve_date_num, room_id: @reservation.room_id } }
    assert_redirected_to reservation_url(@reservation)
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete reservation_url(@reservation)
    end

    assert_redirected_to reservations_url
  end
end
