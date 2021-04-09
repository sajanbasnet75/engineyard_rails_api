# frozen_string_literal: true

module Api
  module V1
    # Hotel Class
    class HotelsController < Api::V1::BaseController
      # before_action :authorize_admin!

      # POST /api/v1/hotels
      def create
        hotel = Hotel.new(hotel_create_params)
        if hotel.save
          render jsonapi: [], code: '200', status: :ok
        else
          render jsonapi_errors: hotel.errors,
                 code: '422', status: :unprocessable_entity
        end
      end

      private

      def hotel_create_params
        params.require(:hotel).permit(:name, :description, :images)
      end
    end
  end
end
