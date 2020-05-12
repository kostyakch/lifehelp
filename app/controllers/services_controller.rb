class ServicesController < ApplicationController
  before_action :set_service, only: %i[edit update destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all.order(:title).limit(100)
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit; end

  # POST /services
  # POST /services.json
  def create
    operation = Service::Operation::Create.new.call(nil, service_params)
    if operation.success?
      render json: operation.value!, status: :created
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    operation = Service::Operation::Update.new.call(nil, service_params.merge(id: params[:id]))
    if operation.success?
      render json: operation.value!, status: :ok
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def service_params
    params.require(:service).permit(%i[title quantity description])
  end
end
