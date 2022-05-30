module Api
  module V1
    class UsersController < ApplicationController
      def index
        @user = User.all
        render json: @user, status: :ok
      end

      def show
        @user = User.includes(
          { postlike: :like_users },
          { postjoin: :join_users },
          { messages: [:post, :user, { message_likes: :user }] },
          { like_messages: [:post, :user, { message_likes: :user }] },
          :followings, :followers
        )
                    .find(params[:id])
        render json: @user.as_json(
          include: [
            { postlike: { include:
              {
                like_users: { only: [:id] }
              } } },
            { postjoin: { include:
              {
                join_users: { only: [:id] }
              } } },
            { messages: { include: [
              {
                message_likes: { include: [{ user: { only: %w[id image name] } }] }
              },
              {
                post: { only: %i[id name image] }
              },
              {
                user: { only: %i[id name image] }
              }
            ] } },
            { like_messages: { include: [
              {
                message_likes: { include: [{ user: { only: %w[id image name] } }] }
              },
              {
                post: { only: %i[id name image] }
              },
              {
                user: { only: %i[id name image] }
              }
            ] } },
            :followings, :followers
          ]
        )
      end

      def destroy
        user = User.find(params[:id])
        if user.destroy
          render json: user
        else
          render json: { status: 400 }
        end
      end

      def search
        if params[:search]
          @user = User.search(params[:search]).includes(:followings, :followers)
          render json: @user.as_json(include: %i[followings followers])
        end
      end
    end
  end
end
