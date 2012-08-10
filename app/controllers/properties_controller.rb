class PropertiesController < ApplicationController
  doorkeeper_for :update, scopes: [:write]

  before_filter :find_owned_resources
  before_filter :find_resource
  before_filter :syncrhronize

  def update
    @device.properties_attributes = @properties
    @device.save
    render '/devices/show'
  end

  private 

  def find_owned_resources
    @devices = Device.where(resource_owner_id: current_user.id)
  end

  def find_resource
    @device = @devices.find(params[:id])
  end

  def syncrhronize
    @device.synchronize_type_properties
    @properties = @device.device_properties params[:properties]
  end
end
