module Api
  module V1
    class PickupsController < ApplicationController
      def index
        post = Pickup.all.includes(:post)
        render json: post.as_json(include: :post)
      end

      def create
        post = Pickup.new(post_params)
        render json: post, status: :created if post.save
      end

      def destroy
        post = Pickup.find(params[:id])
        render json: post if post.destroy
      end

      private

      def post_params
        params.permit(:post_id)
      end
    end
  end
end
