class GivingEventsController < ApplicationController

  def create
    giving_event = GivingEvent.new(giving_event_params)
    if giving_event.valid?
      giving_event.save
      render json: giving_event.to_json(giving_event_serializer)
    else
      render json: {message: 'Event not saved!'}
    end
  end

  private

  def giving_event_params
    params.require(:giving_event).permit(:name, :description, :target_amount, :start_date, :end_date, :organization_id)
  end

  def giving_event_serializer
    {except: [:created_at, :updated_at]}
  end
end
