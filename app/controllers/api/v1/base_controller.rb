# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      skip_forgery_protection
    end
  end
end
