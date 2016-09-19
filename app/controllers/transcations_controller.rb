class TranscationsController < ApplicationController
  before_action :set_transcation, only: [:show, :edit, :update, :destroy]

  # GET /transcations
  # GET /transcations.json
  def index
    @transcations = Transcation.all
  end

  # GET /transcations/1
  # GET /transcations/1.json
  def show
  end

  # GET /transcations/new
  def new
    @transcation = Transcation.new
  end

  # GET /transcations/1/edit
  def edit
  end

  # POST /transcations
  # POST /transcations.json
  def create
    @transcation = Transcation.new(transcation_params)

    respond_to do |format|
      if @transcation.save
        format.html { redirect_to @transcation, notice: 'Transcation was successfully created.' }
        format.json { render :show, status: :created, location: @transcation }
      else
        format.html { render :new }
        format.json { render json: @transcation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transcations/1
  # PATCH/PUT /transcations/1.json
  def update
    respond_to do |format|
      if @transcation.update(transcation_params)
        format.html { redirect_to @transcation, notice: 'Transcation was successfully updated.' }
        format.json { render :show, status: :ok, location: @transcation }
      else
        format.html { render :edit }
        format.json { render json: @transcation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transcations/1
  # DELETE /transcations/1.json
  def destroy
    @transcation.destroy
    respond_to do |format|
      format.html { redirect_to transcations_url, notice: 'Transcation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transcation
      @transcation = Transcation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transcation_params
      params.require(:transcation).permit(:transcation_type, :transaction_id, :transcation_date)
    end
end
