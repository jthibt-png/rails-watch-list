class SignetsController < ApplicationController
  before_action :set_signet, only: %i[ show edit update destroy ]

  # GET /signets or /signets.json
  def index
    @signets = Signet.all
  end

  # GET /signets/1 or /signets/1.json
  def show
  end

  # GET /signets/new
  def new
    @signet = Signet.new
  end

  # GET /signets/1/edit
  def edit
  end

  # POST /signets or /signets.json
  def create
    @signet = Signet.new(signet_params)

    respond_to do |format|
      if @signet.save
        format.html { redirect_to @signet, notice: "Signet was successfully created." }
        format.json { render :show, status: :created, location: @signet }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @signet.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /signets/1 or /signets/1.json
  def update
    respond_to do |format|
      if @signet.update(signet_params)
        format.html { redirect_to @signet, notice: "Signet was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @signet }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @signet.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /signets/1 or /signets/1.json
  def destroy
    @signet.destroy!

    respond_to do |format|
      format.html { redirect_to signets_path, notice: "Signet was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signet
      @signet = Signet.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def signet_params
      params.expect(signet: [ :comment ])
    end
end
