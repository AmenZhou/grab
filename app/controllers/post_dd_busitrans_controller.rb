class PostDdBusitransController < ApplicationController
  before_action :set_post_dd_busitran, only: [:show, :edit, :update, :destroy]

  # GET /post_dd_busitrans
  # GET /post_dd_busitrans.json
  def index
    @post_dd_busitrans = PostDdBusitran.all
  end

  def grab_dd_busitran
    PostDdBusitran.grab_dd_busitran post_dd_busitran_params[:grab_lines].to_i
    redirect_to action: :index
  end
  
  # GET /post_dd_busitrans/1
  # GET /post_dd_busitrans/1.json
  def show
  end

  # GET /post_dd_busitrans/new
  def new
    @post_dd_busitran = PostDdBusitran.new
  end

  # GET /post_dd_busitrans/1/edit
  def edit
  end

  # POST /post_dd_busitrans
  # POST /post_dd_busitrans.json
  def create
    @post_dd_busitran = PostDdBusitran.new(post_dd_busitran_params)

    respond_to do |format|
      if @post_dd_busitran.save
        format.html { redirect_to @post_dd_busitran, notice: 'Post dd busitran was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_dd_busitran }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_dd_busitran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_dd_busitrans/1
  # PATCH/PUT /post_dd_busitrans/1.json
  def update
    respond_to do |format|
      if @post_dd_busitran.update(post_dd_busitran_params)
        format.html { redirect_to @post_dd_busitran, notice: 'Post dd busitran was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_dd_busitran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_dd_busitrans/1
  # DELETE /post_dd_busitrans/1.json
  def destroy
    @post_dd_busitran.destroy
    respond_to do |format|
      format.html { redirect_to post_dd_busitrans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_dd_busitran
      @post_dd_busitran = PostDdBusitran.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_dd_busitran_params
      params.require(:post).permit(:grab_lines, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time)
    end
end
