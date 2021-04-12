# frozen_string_literal: true

module Api
  module V1
    class BookingsController < Api::V1::BaseController
      before_action :authorize_request!

      # POST /api/v1/bookings
      def index
        bookings = @current_customer.bookings
        render jsonapi: bookings, status: :ok, code: '200'
      end

      # POST /api/v1/bookings
      def create
        booked_room = get_booked_room

        # TODO: check if room is available & exception handler
        return unless booked_room.present?

        @booking = @current_customer.bookings.new(booking_params)
        if @booking.save
          # TODO: decrese the room quantity
          # TODO: generate booking code and invoice id
          # TODO make room unavailabe for particular datetime
          # TODO payment related task
          render jsonapi: [], status: :ok, code: '200'
        else
          render jsonapi_errors: @booking.errors,
                 code: '422', status: :unprocessable_entity
        end
      end

       # PATCH /api/v1/bookings/:id
      def update
        # TODO: before update must hit api to check if booked room is available
        booking = @current_customer.bookings.find(params[:id])
        if booking.update(booking_update_params)
          # TODO: after update also update the payment details, room quantity
          render jsonapi: [], status: :ok, code: '200'
        else
          render jsonapi_errors: booking.errors,
                 code: '422', status: :unprocessable_entity
        end
      end

      private

      def get_booked_room
        Room.find(booking_params[:room_id])
      end

      def booking_update_params
        params.require(:booking).permit(:booked_check_in, :booked_check_out)
      end

      def booking_params
        params.require(:booking).permit(:hotel_id,
                                        :room_id,
                                        :room_rate_id,
                                        :booked_check_in,
                                        :booked_check_out,
                                        :no_of_adults,
                                        :no_of_child,
                                        :no_of_rooms,
                                        payment_attributes: %i[total_amt
                                                               card_number
                                                               card_exp_date
                                                               pay_type
                                                               pay_status
                                                               billing_name
                                                               billing_street
                                                               billing_country
                                                               billing_state
                                                               billing_city])
      end
    end
  end
end
