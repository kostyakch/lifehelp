class PerformersController < ApplicationController
  before_action :set_performer, only: %i[edit update destroy]

  # GET /performers
  # GET /performers.json
  def index
    # TODO: Change limit to page
    @performers = Performer.sorted.limit(100)
  end

  # GET /performers/new
  def new
    @performer = Performer.new
  end

  # GET /performers/1/edit
  def edit; end

  # POST /performers
  # POST /performers.json
  def create
    operation = Performer::Operation::Create.new.call(nil, performer_params)
    if operation.success?
      render json: operation.value!, status: :created
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /performers/1
  # PATCH/PUT /performers/1.json
  def update
    operation = Performer::Operation::Update.new.call(nil, performer_params.merge(id: params[:id]))
    if operation.success?
      render json: operation.value!, status: :ok
    else
      render json: operation.failure, status: :unprocessable_entity
    end
  end

  # DELETE /performers/1
  # DELETE /performers/1.json
  def destroy
    @performer.destroy
  end

  def search
    @performers = Performer.search_for(params[:q]).limit(50)
    render partial: 'index.json', performers: @performers
    # render jbuilder: @services
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_performer
    @performer = Performer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def performer_params
    params.require(:performer)
          .permit(%i[first_name last_name middle_name performer_type
                     phone email address description])
  end
end
