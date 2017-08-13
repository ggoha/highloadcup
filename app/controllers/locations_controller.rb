class LocationsController < ApplicationController
	def avg
	end

	private

	def set_resource
		@resource = Location.find_by_id(params[:id])
	end

	def new_resource
		@resource = Location.new
	end

	def resource_param
		params.permit(:place, :country, :city, :distance)
	end
end
