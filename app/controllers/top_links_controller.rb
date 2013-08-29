class TopLinksController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_top_link, only: [:show, :edit, :update, :destroy]

  # GET /top_links
  # GET /top_links.json
  def index
    @top_links = TopLink.all
  end

  # GET /top_links/1
  # GET /top_links/1.json
  def show
  end

  # GET /top_links/new
  def new
    @top_link = TopLink.new
  end

  # GET /top_links/1/edit
  def edit
  end

  # POST /top_links
  # POST /top_links.json
  def create
    @top_link = TopLink.new(top_link_params)

    respond_to do |format|
      if @top_link.save
        format.html { redirect_to @top_link, notice: 'Top link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @top_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @top_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /top_links/1
  # PATCH/PUT /top_links/1.json
  def update
    respond_to do |format|
      if @top_link.update(top_link_params)
        format.html { redirect_to @top_link, notice: 'Top link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @top_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /top_links/1
  # DELETE /top_links/1.json
  def destroy
    @top_link.destroy
    respond_to do |format|
      format.html { redirect_to top_links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top_link
      @top_link = TopLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_link_params
      params.require(:top_link).permit(:title, :href)
    end
end
