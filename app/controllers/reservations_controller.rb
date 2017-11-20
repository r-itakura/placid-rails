class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # 宿泊者予約一覧
  def list
    # 宿泊予約件数取得
    require "date"
    today = Date.today
    count = Reservation.where('reserve_date >= ?', today).count

    if count == 0
      # 取得件数が0の場合
      @error = '宿泊予約はありません。'
    else
      # 一覧取得SQL文作成
      $strSql = "select ";
      $strSql .= "  TRESERVE.RESERVE_ID, ";
      $strSql .= "  TGUEST.SEI, ";
      $strSql .= "  TGUEST.MEI, ";
      $strSql .= "  TRESERVE.RSV_D, ";
      $strSql .= "  TPLAN.PLAN_TITLE, ";
      $strSql .= "  TRESERVE.PRICE, ";
      $strSql .= "  TRESERVE.CANCEL_FLG ";
      $strSql .= "from ";
      $strSql .= "  TRESERVE ";
      $strSql .= "  inner join TGUEST on TRESERVE.GUEST_ID = TGUEST.GUEST_ID ";
      $strSql .= "  left outer join TPLAN on TRESERVE.PLAN_ID = TPLAN.PLAN_ID ";
      $strSql .= "where cast(TRESERVE.RSV_D as date) >= current_date ";
      $strSql .= "order by TRESERVE.RSV_D asc, TRESERVE.RESERVE_ID asc ";
      @reservations = Reservation.where('reserve_date >= ?', today)
    end
    # if($ret === "0"){
    #     // 取得件数が0の場合
    # $errMsg = "宿泊予約はありません。";
    # }
  end

  # GET /reservations
  # GET /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:hotel_id, :guest_id, :plan_id, :guest_num, :reserve_date, :reserve_date_num, :price, :cancel_flag)
    end
end
