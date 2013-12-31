class PostUloHousrentsController < ApplicationController
  before_action :set_post_ulo_housrent, only: [:show, :edit, :update, :destroy]

  # GET /post_ulo_housrents
  # GET /post_ulo_housrents.json
  def index
    @post_ulo_housrents = PostUloHousrent.all
  end

  def grab_ulo_housrent
	PostUloHousrent.grab_ulo_housrent post_ulo_housrent_params[:grab_lines].to_i
	redirect_to action: :index
  end
  # GET /post_ulo_housrents/1
  # GET /post_ulo_housrents/1.json
  def show
  end

  # GET /post_ulo_housrents/new
  def new
    @post_ulo_housrent = PostUloHousrent.new
  end

  # GET /post_ulo_housrents/1/edit
  def edit
  end

  # POST /post_ulo_housrents
  # POST /post_ulo_housrents.json
  def create
    @post_ulo_housrent = PostUloHousrent.new(post_ulo_housrent_params)

    respond_to do |format|
      if @post_ulo_housrent.save
        format.html { redirect_to @post_ulo_housrent, notice: 'Post ulo housrent was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_ulo_housrent }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_ulo_housrent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_ulo_housrents/1
  # PATCH/PUT /post_ulo_housrents/1.json
  def update
    respond_to do |format|
      if @post_ulo_housrent.update(post_ulo_housrent_params)
        format.html { redirect_to @post_ulo_housrent, notice: 'Post ulo housrent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_ulo_housrent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_ulo_housrents/1
  # DELETE /post_ulo_housrents/1.json
  def destroy
    @post_ulo_housrent.destroy
    respond_to do |format|
      format.html { redirect_to post_ulo_housrents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_ulo_housrent
      @post_ulo_housrent = PostUloHousrent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_ulo_housrent_params
      params.require(:post).permit(:grab_lines, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time)
    end
end
