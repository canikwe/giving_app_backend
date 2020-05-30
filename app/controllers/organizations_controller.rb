class OrganizationsController < ApplicationController

  def index
    organizations = Organization.all
    render json: organizations.to_json(org_serializer), status: :ok
  end

  def create
    organization = Organization.new(organization_params)
    if organization.valid?
      organization.save
      render json: organization.to_json(org_serializer), status: :created
    else
      render json: {message: organization.errors.full_messages}, status: :precondition_failed
    end
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :address, :description, :admin_id)
  end

  def org_serializer
    {except: [:created_at, :updated_at]}
  end
end
