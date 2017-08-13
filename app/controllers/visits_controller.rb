class VisitsController < ApplicationController
	private
	def set_resource
		@resource = Visit.find_by_id(params[:id])
	end

	def new_resource
		@resource = Visit.new
	end
end
