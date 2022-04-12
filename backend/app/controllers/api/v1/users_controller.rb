module Api
  module V1
    class UsersController < ApplicationController
      def index
        @user = User.all
        render json: @user, status: :ok
      end

      def show

      end

      def destroy
        user = User.find(params[:id])
        if user,destroy
          render json: user
        else
          render json: { status: 400 }
        end
      end
    end
  end
end
