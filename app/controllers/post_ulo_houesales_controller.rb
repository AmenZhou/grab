class PostUloHouesalesController < ApplicationController
  before_action :set_post_ulo_houesale, only: [:show, :edit, :update, :destroy]

  # GET /post_ulo_houesales
  # GET /post_ulo_houesales.json
  def index
    PostUloHouesale.grab_ulo_houesale
    @post_ulo_houesales = PostUloHouesale.all
  end

  # GET /post_ulo_houesales/1
  # GET /post_ulo_houesales/1.json
  def show
  end

  # GET /post_ulo_houesales/new
  def new
    @post_ulo_houesale = PostUloHouesale.new
  end

  # GET /post_ulo_houesales/1/edit
  def edit
  end

  # POST /post_ulo_houesales
  # POST /post_ulo_houesales.json
  def create
    @post_ulo_houesale = PostUloHouesale.new(post_ulo_houesale_params)

    respond_to do |format|
      if @post_ulo_houesale.save
        format.html { redirect_to @post_ulo_houesale, notice: 'Post ulo houesale was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_ulo_houesale }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_ulo_houesale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_ulo_houesales/1
  # PATCH/PUT /post_ulo_houesales/1.json
  def update
    respond_to do |format|
      if @post_ulo_houesale.update(post_ulo_houesale_params)
        format.html { redirect_to @post_ulo_houesale, notice: 'Post ulo houesale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_ulo_houesale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_ulo_houesales/1
  # DELETE /post_ulo_houesales/1.json
  def destroy
    @post_ulo_houesale.destroy
    respond_to do |format|
      format.html { redirect_to post_ulo_houesales_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_ulo_houesale
      @post_ulo_houesale = PostUloHouesale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_ulo_houesale_params
      params.require(:post_ulo_houesale).permit(:title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time)
    end
end