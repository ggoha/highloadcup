class ApplicationController < ActionController::API
	before_action :set_resource, except: [:create]
	before_action :new_resource, only: [:create]
	def show
		if @resource
			render json: @resource
		else
			render status: :not_found
		end
	end

	def update
		if @resource
			if @resource.update(resource_param(params))
				render status: :ok
			else
				render status: :bad_request
			end
		else
			render status: :not_found
		end
	end

	def create
		if @resource.update(resource_param(params))
			render status: :ok
		else
			render status: :bad_request
		end
	end
end
