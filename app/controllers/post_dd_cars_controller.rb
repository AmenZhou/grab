class PostDdCarsController < ApplicationController
  before_action :set_post_dd_car, only: [:show, :edit, :update, :destroy]

  # GET /post_dd_cars
  # GET /post_dd_cars.json
  def index
    @post_dd_cars = PostDdCar.all
  end

  # GET /post_dd_cars/1
  # GET /post_dd_cars/1.json
  def show
  end

  # GET /post_dd_cars/new
  def new
    @post_dd_car = PostDdCar.new
  end

  # GET /post_dd_cars/1/edit
  def edit
  end

  # POST /post_dd_cars
  # POST /post_dd_cars.json
  def create
    @post_dd_car = PostDdCar.new(post_dd_car_params)

    respond_to do |format|
      if @post_dd_car.save
        format.html { redirect_to @post_dd_car, notice: 'Post dd car was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_dd_car }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_dd_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_dd_cars/1
  # PATCH/PUT /post_dd_cars/1.json
  def update
    respond_to do |format|
      if @post_dd_car.update(post_dd_car_params)
        format.html { redirect_to @post_dd_car, notice: 'Post dd car was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_dd_car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_dd_cars/1
  # DELETE /post_dd_cars/1.json
  def destroy
    @post_dd_car.destroy
    respond_to do |format|
      format.html { redirect_to post_dd_cars_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_dd_car
      @post_dd_car = PostDdCar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_dd_car_params
      params.require(:post_dd_car).permit(:title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time)
    end
end
