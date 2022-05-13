module Api
  module V1
    class HealthCheckController < ApplicationController
      def index
        head :ok
      end
    end
  end
end
