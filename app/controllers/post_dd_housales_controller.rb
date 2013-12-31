class PostDdHousalesController < ApplicationController
  before_action :set_post_dd_housale, only: [:show, :edit, :update, :destroy]

  # GET /post_dd_housales
  # GET /post_dd_housales.json
  def index
    @post_dd_housales = PostDdHousale.all
  end
  
  def grab_dd_housale
    PostDdHousale.grab_dd_housale post_dd_housale_params[:grab_lines].to_i
    redirect_to action: :index
  end
  # GET /post_dd_housales/1
  # GET /post_dd_housales/1.json
  def show
  end

  # GET /post_dd_housales/new
  def new
    @post_dd_housale = PostDdHousale.new
  end

  # GET /post_dd_housales/1/edit
  def edit
  end

  # POST /post_dd_housales
  # POST /post_dd_housales.json
  def create
    @post_dd_housale = PostDdHousale.new(post_dd_housale_params)

    respond_to do |format|
      if @post_dd_housale.save
        format.html { redirect_to @post_dd_housale, notice: 'Post dd housale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_dd_housale }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_dd_housale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_dd_housales/1
  # PATCH/PUT /post_dd_housales/1.json
  def update
    respond_to do |format|
      if @post_dd_housale.update(post_dd_housale_params)
        format.html { redirect_to @post_dd_housale, notice: 'Post dd housale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_dd_housale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_dd_housales/1
  # DELETE /post_dd_housales/1.json
  def destroy
    @post_dd_housale.destroy
    respond_to do |format|
      format.html { redirect_to post_dd_housales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_dd_housale
      @post_dd_housale = PostDdHousale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_dd_housale_params
      debugger
      params.require(:post_dd_housale).permit(:title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time)
    end
end
