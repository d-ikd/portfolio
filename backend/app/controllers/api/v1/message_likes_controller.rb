module Api
  module V1
    class MessageLikesController < ApplicationController
      before_action :set_message, only: [:destroy]

      def create
        like_message = MessageLike.new(message_params)
        if like_message.save
          render json: like_message
        else
          render json: { status: 400 }
        end
      end

      def destroy
        likemessage = @user.un_like_message(@message)
        if likemessage.destroy
          render json: likemessage
        else
          render json: { status: 400 }
        end
      end

      private

      def set_message
        @user = User.find(params[:user_id])
        @message = Message.find(params[:message_id])
      end

      def message_params
        params.permit(:user_id, :message_id)
      end
    end
  end
end
