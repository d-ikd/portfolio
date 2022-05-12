module Api
  module V1
    class PostsController < ApplicationController
      # before_action :allpost, :new_post, :new_plan_post, only: [:index, :show, :create, :update, :destroy]
      # https://qiita.com/dl10yr/items/533cecd1d6f9abcfd13c

      def index
        @post = Post.all.includes(:like_users, :reviews)
        render json: @post.as_json(include: %i[like_users reviews], methods: :avg_rate)
        # render json: @post.as_json(only: [:id, :name,:image],include: {like_users: {only: ['id']}})
      end

      def allpost
        post = Post.all.includes(:pickups)
        render json: post.as_json(include: %i[pickups])
      end

      def new_post
        from = Time.current.at_beginning_of_day
        to = (from - 1.month)
        @post = Post.where(release: to...from).order(release: :desc)
        render json: @post
      end

      def new_plan_post
        from = Time.current.at_beginning_of_day
        to = (from + 1.month)
        @post = Post.where(release: from...to).order(:release)
        render json: @post
      end

      # def total_rank
      #   @posts = Post.find(PostLike.group(:post_id).order('count(post_id) desc').limit(50).pluck(:post_id))
      #   render json: @posts
      # end

      def show
        @post = Post.includes(:like_users, { reviews: [:post, :user, { review_likes: :user },] }).find(params[:id])
        render json: @post.as_json(include: [:like_users, { reviews: { include: [{ user: { only: %w[id image name] } },
                                                                                 { post: { only: [:name] } },
                                                                                 { review_likes: { include: [{ user: { only: %w[id image name] }},] } }]}}],
                                   methods: :avg_rate)
      end

      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created
        else
          render json: { status: 400 }
        end
      end

      def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
          render json: @post
        else
          render json: { status: 400 }
        end
      end

      def destroy
        post = Post.find(params[:id])
        if post.destroy
          render json: post
        else
          render json: { status: 400 }
        end
      end

      def search
        if params[:search]
          @post = Post.search(params[:search]).includes(:like_users, :reviews).order(release: :desc)
          render json: @post.as_json(include: %i[like_users reviews], methods: :avg_rate)
        end
      end

      private

      def post_params
        params.permit(:name, :details, :start_time, :finish_time, :member, :place, :category, :image, :release, :price)
      end
    end
  end
end
