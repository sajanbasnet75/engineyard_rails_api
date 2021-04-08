# frozen_string_literal: true

module Api
  module V1
    # Room Class
    class RoomsController < Api::V1::BaseController
      # before_action :authorize_admin!

      # POST /api/v1/rooms
      def create
        hotel = Hotel.find(params[:hotel_id])
        return unless hotel.present?

        room = hotel.rooms.new(room_create_params)
        if room.save
          render jsonapi: [], code: '200', status: :ok
        else
          render jsonapi_errors: hotel.errors,
                 code: '422', status: :unprocessable_entity
        end
      end

      private

      def room_create_params
        params.require(:room).permit(:name, :description, :room_type, :room_class, :total_quantity,
                                     amenities_attributes: %i[name description is_available],
                                     room_rates_attributes: %i[rate_type min_price max_price is_active])
      end
    end
  end
end
