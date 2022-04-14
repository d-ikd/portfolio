module Api
  module V1
    class PickupsController < ApplicationController
      def index
        post = Pickup.all.includes(:post)
        render json: post.as_json(include: :post)
      end

      private

      def post_params
        params.permit(:post_id)
      end
  end
end
