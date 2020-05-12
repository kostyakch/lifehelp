class ClientsController < ApplicationController
  include ApplicationHelper
  before_action :set_client, only: %i[edit update destroy]

  # GET /clients
  def index
    # TODO: Chenge to Operation
    @clients = Client.all.order(:last_name).limit(100)
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit; end

  # POST /clients
  def create
    operation = Client::Operation::Create.new.call(nil, client_params)
    if operation.success?
      render json: operation.value!, status: :created
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    operation = Client::Operation::Update.new.call(nil, client_params)
    if operation.success?
      render json: operation.value!, status: :ok
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def client_params
    params.require(:client).permit!
  end
end
