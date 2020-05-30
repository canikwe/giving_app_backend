class DonationsController < ApplicationController

  def index
    donations = Donation.all
    render json: donations.to_json(donation_serializer)
  end

  def create
    donation = Donation.new(donation_params)

    if donation.valid?
      donation.save

      render json: donation.to_json(donation_serializer)
    else
      render json: {message: 'Error adding donation'}
    end
  end

  private
  def donation_params
    params.require(:donation).permit(:amount, :donor_id, :giving_event_id)
  end

  def donation_serializer
    {except: :updated_at}
  end
end
