module Api
  module V1
    class ReviewsController < ApplicationController
      def index
        review = Review.all.includes(:user, :post)
        render json: review.as_json(include: [{ user: { only: %w[id image name] } },
                                              { post: { only: %w[id image name] } }])
      end

      def create
        review = Review.new(review_params)
        if review.save
          render json: review
        else
          render json: { status: 400 }
        end
      end

      def update
        @review = Review.find(params[:review_id])
        if @review.update(review_params)
          render json: @review
        else
          render json: { status: 400 }
        end
      end

      def destroy
        review = Review.find(params[:id])
        if review.destroy
          render json: review
        else
          render json: { status: 400 }
        end
      end

      private

      # def set_user
      #   @user = User.find(params[:user_id])
      #   @post = Post.find(params[:post_id])
      # end

      def review_params
        params.permit(:user_id, :post_id, :title, :rate, :content, :image)
      end
    end
  end
end
