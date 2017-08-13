class UsersController < ApplicationController
	def visits
		if @resource
			result = @resource.visits
			result = result.from_date(params[:fromDate]) if params[:fromDate].present?
			result = result.to_date(params[:toDate]) if params[:toDate].present?
			result = result.by_country(params[:country]) if params[:country].present?
			result = result.to_distance(params[:toDistance]) if params[:toDistance].present?
			render json: result.order(:visited_at)
		else
			render status: :not_found
		end
	end

	private

	def set_resource
		@resource = User.find_by_id(params[:id])
	end

	def new_resource
		@resource = User.new
	end

	def resource_param
		params.permit(:email, :first_name, :last_name, :gender, :birth_name)
	end
end
