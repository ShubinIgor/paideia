class BokmarksController < ApplicationController
  before_action :set_bokmark, only: %i[ show edit update destroy ]

  # GET /bokmarks or /bokmarks.json
  def index
    @bokmarks = Bokmark.all
  end

  # GET /bokmarks/1 or /bokmarks/1.json
  def show
  end

  # GET /bokmarks/new
  def new
    @bokmark = Bokmark.new
  end

  # GET /bokmarks/1/edit
  def edit
  end

  # POST /bokmarks or /bokmarks.json
  def create
    @bokmark = Bokmark.new(bokmark_params)

    respond_to do |format|
      if @bokmark.save
        format.html { redirect_to bokmark_url(@bokmark), notice: "Bokmark was successfully created." }
        format.json { render :show, status: :created, location: @bokmark }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bokmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bokmarks/1 or /bokmarks/1.json
  def update
    respond_to do |format|
      if @bokmark.update(bokmark_params)
        format.html { redirect_to bokmark_url(@bokmark), notice: "Bokmark was successfully updated." }
        format.json { render :show, status: :ok, location: @bokmark }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bokmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bokmarks/1 or /bokmarks/1.json
  def destroy
    @bokmark.destroy

    respond_to do |format|
      format.html { redirect_to bokmarks_url, notice: "Bokmark was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bokmark
      @bokmark = Bokmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bokmark_params
      params.require(:bokmark).permit(:title, :url)
    end
end
