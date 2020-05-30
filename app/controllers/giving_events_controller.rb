class GivingEventsController < ApplicationController
  before_action :get_giving_event, only: :update

  def index
    giving_events = GivingEvent.all
    render json: giving_events.to_json(giving_event_serializer), status: :ok
  end

  def index
    giving_events = GivingEvent.all
    render json: giving_events.to_json(giving_event_serializer), status: :ok
  end

  def create
    giving_event = GivingEvent.new(giving_event_params)
    if giving_event.valid?
      giving_event.save
      render json: giving_event.to_json(giving_event_serializer), status: :created
    else
      render json: {message: giving_event.errors.full_messages}, status: :precondition_failed
    end
  end

  def update
    if @giving_event.update(giving_event_params)
      render json: @giving_event.to_json(giving_event_serializer), status: :accepted
    else
      render json: {message: @giving_event.errors.full_messages}, status: :precondition_failed
    end
  end

  private

  def get_giving_event
    @giving_event = GivingEvent.find(params[:id])
  end

  def giving_event_params
    params.require(:giving_event).permit(:name, :description, :target_amount, :start_date, :end_date, :organization_id)
  end

  def giving_event_serializer
    {except: [:created_at, :updated_at]}
  end
end
