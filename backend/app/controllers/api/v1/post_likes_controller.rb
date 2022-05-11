module Api
  module V1
    class PostLikesController < ApplicationController
      before_action :set_user, only: [:destroy]

      def create
        likepost = PostLike.new(like_params)
        if likepost.save
          render json: @user
        else
          render json: { status: 400 }
        end
      end

      def destroy
        likepost = @user.unlike(@post)
        if likepost.destroy
          render json: @user
        else
          render json: { status: 400 }
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
        @post = Post.find(params[:post_id])
      end

      def like_params
        params.permit(:user_id, :post_id)
      end
    end
  end
end
