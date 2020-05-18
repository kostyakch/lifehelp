class ClientServicesController < ApplicationController
  before_action :set_client_service, only: %i[show edit destroy]

  # GET /client_services
  # GET /client_services.json
  def index
    @client_services = ClientService.sorted.page(params[:page])
  end

  # GET /client_services/1
  # GET /client_services/1.json
  def show; end

  # GET /client_services/new
  def new
    @client_service = ClientService.new(
      client_id: params[:client_id],
      started_at: Time.current
    )
    @client_services = ClientService.by_client(params[:client_id])
                                    .sorted.page(params[:page])
  end

  # GET /client_services/1/edit
  def edit; end

  # POST /client_services
  # POST /client_services.json
  def create
    operation = ClientService::Operation::Create.new.call(nil, client_service_params)
    if operation.success?
      render json: operation.value!, status: :created
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_services/1
  # PATCH/PUT /client_services/1.json
  def update
    operation = ClientService::Operation::Update
                .new.call(nil, client_service_params.merge(id: params[:id]))
    if operation.success?
      render json: operation.value!, status: :ok
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # DELETE /client_services/1
  # DELETE /client_services/1.json
  def destroy
    @client_service.destroy
  end

  def search
    @client_services = ClientService.search_for(params[:q])
                                    .limit(Kaminari.config.default_per_page)
    render partial: 'index.json', client_services: @client_services
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client_service
    @client_service = ClientService.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_service_params
    params.require(:client_service)
          .permit(%i[status review started_at finished_at client_id service_id performer_id])
  end
end
