class PostUlosController < ApplicationController
  before_action :set_post_ulo, only: [:show, :edit, :update, :destroy]

  # GET /post_ulos
  # GET /post_ulos.json
  def index
    @post_ulos = PostUlo.where(:site_source => params[:select_source]).order('upload_time desc').all
  end

  def grab_ulo
		PostUlo.grab_ulo(post_ulo_params[:grab_lines].to_i, post_ulo_params[:grab_source])
		redirect_to action: :index, :select_source => post_ulo_params[:grab_source]
  end
	
	def clear_ulo
		PostUlo.clear_ulo
		@Post_clear_ulo
		render 'posts/home'
	end
  # GET /post_ulos/1
  # GET /post_ulos/1.json
  def show
  end

  # GET /post_ulos/new
  def new
    @post_ulo = PostUlo.new
  end

  # GET /post_ulos/1/edit
  def edit
  end

  # POST /post_ulos
  # POST /post_ulos.json
  def create
    @post_ulo = PostUlo.new(post_ulo_params)

    respond_to do |format|
      if @post_ulo.save
        format.html { redirect_to @post_ulo, notice: 'Post ulo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_ulo }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_ulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_ulos/1
  # PATCH/PUT /post_ulos/1.json
  def update
    respond_to do |format|
      if @post_ulo.update(post_ulo_params)
        format.html { redirect_to @post_ulo, notice: 'Post ulo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_ulo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_ulos/1
  # DELETE /post_ulos/1.json
  def destroy
    @post_ulo.destroy
    respond_to do |format|
      format.html { redirect_to post_ulos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_ulo
      @post_ulo = PostUlo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_ulo_params
      params.require(:post).permit(:grab_source, :grab_lines, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source)
    end
end
