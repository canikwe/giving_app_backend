class OrganizationsController < ApplicationController

  def index
    organizations = Organization.all
    render json: organizations.to_json(org_serializer)  
  end

  def create
    organization = Organization.new(organization_params)
    if organization.valid?
      organization.save
      render json: organization.to_json(org_serializer)  
    else
      render json: {message: 'Something went wrong'}
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
