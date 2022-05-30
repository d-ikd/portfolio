module Api
  module V1
    class MessagesController < ApplicationController
      def index
        message = Message.all.includes(:user, :post)
        render json: message.as_json(include: [{ user: { only: %w[id image name] } },
                                               { post: { only: %w[id image name] } }])
      end

      def create
        message = Message.new(message_params)
        if message.save
          render json: message
        else
          render json: { status: 400 }
        end
      end

      def update
        @message = Message.find(params[:message_id])
        if @message.update(message_params)
          render json: @message
        else
          render json: { status: 400 }
        end
      end

      def destroy
        message = Message.find(params[:id])
        if message.destroy
          render json: message
        else
          render json: { status: 400 }
        end
      end

      private

      # def set_user
      #   @user = User.find(params[:user_id])
      #   @post = Post.find(params[:post_id])
      # end

      def message_params
        params.permit(:user_id, :post_id, :title, :content, :image)
      end
    end
  end
end
