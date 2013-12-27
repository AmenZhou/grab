class PostUloBusitransController < ApplicationController
  before_action :set_post_ulo_busitran, only: [:show, :edit, :update, :destroy]

  # GET /post_ulo_busitrans
  # GET /post_ulo_busitrans.json
  def index
	PostUloBusitran.grab_ulo_busitran
    @post_ulo_busitrans = PostUloBusitran.all
  end

  # GET /post_ulo_busitrans/1
  # GET /post_ulo_busitrans/1.json
  def show
  end

  # GET /post_ulo_busitrans/new
  def new
    @post_ulo_busitran = PostUloBusitran.new
  end

  # GET /post_ulo_busitrans/1/edit
  def edit
  end

  # POST /post_ulo_busitrans
  # POST /post_ulo_busitrans.json
  def create
    @post_ulo_busitran = PostUloBusitran.new(post_ulo_busitran_params)

    respond_to do |format|
      if @post_ulo_busitran.save
        format.html { redirect_to @post_ulo_busitran, notice: 'Post ulo busitran was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_ulo_busitran }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_ulo_busitran.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_ulo_busitrans/1
  # PATCH/PUT /post_ulo_busitrans/1.json
  def update
    respond_to do |format|
      if @post_ulo_busitran.update(post_ulo_busitran_params)
        format.html { redirect_to @post_ulo_busitran, notice: 'Post ulo busitran was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_ulo_busitran.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_ulo_busitrans/1
  # DELETE /post_ulo_busitrans/1.json
  def destroy
    @post_ulo_busitran.destroy
    respond_to do |format|
      format.html { redirect_to post_ulo_busitrans_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_ulo_busitran
      @post_ulo_busitran = PostUloBusitran.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_ulo_busitran_params
      params.require(:post_ulo_busitran).permit(:title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time)
    end
end
