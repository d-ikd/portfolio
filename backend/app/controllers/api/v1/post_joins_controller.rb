module Api
  module V1
    class PostJoinsController < ApplicationController
      before_action :set_user, only: [:destroy]

      def create
        joinpost = PostJoin.new(join_params)
        if joinpost.save
          render json: @user
        else
          render json: { status: 400 }
        end
      end

      def destroy
        joinpost = @user.unjoin(@post)
        if joinpost.destroy
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

      def join_params
        params.permit(:user_id, :post_id)
      end
    end
  end
end
