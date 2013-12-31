class PostRecruitsController < ApplicationController
  before_action :set_post_recruit, only: [:show, :edit, :update, :destroy]

  # GET /post_recruits
  # GET /post_recruits.json
  def index   
    @post_recruits = PostRecruit.all
  end

  def grab_dd_recruit
    PostRecruit.grab_dd_recruit post_recruit_params[:grab_lines].to_i
    redirect_to action: :index
  end
  
  # GET /post_recruits/1
  # GET /post_recruits/1.json
  def show
  end

  # GET /post_recruits/new
  def new
    @post_recruit = PostRecruit.new
  end

  # GET /post_recruits/1/edit
  def edit
  end

  # POST /post_recruits
  # POST /post_recruits.json
  def create
    @post_recruit = PostRecruit.new(post_recruit_params)

    respond_to do |format|
      if @post_recruit.save
        format.html { redirect_to @post_recruit, notice: 'Post recruit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post_recruit }
      else
        format.html { render action: 'new' }
        format.json { render json: @post_recruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_recruits/1
  # PATCH/PUT /post_recruits/1.json
  def update
    respond_to do |format|
      if @post_recruit.update(post_recruit_params)
        format.html { redirect_to @post_recruit, notice: 'Post recruit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post_recruit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_recruits/1
  # DELETE /post_recruits/1.json
  def destroy
    @post_recruit.destroy
    respond_to do |format|
      format.html { redirect_to post_recruits_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_recruit
      @post_recruit = PostRecruit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_recruit_params
      params.require(:post).permit(:grab_lines, :title, :ct_name, :unique_code, :detail_url, :upload_time, :content, :phone_n, :rent_m, :site_source, :up_time)
    end
end
