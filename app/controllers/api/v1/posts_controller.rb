# frozen_string_literal: true

module Api
  module V1
    class PostsController < Api::V1::ApiController
      before_action :authenticate!
      before_action :ensure_session_timeout
      before_action :set_post, only: %i[show update destroy]

      def index
        posts = Post.all
        render json: { posts: ::PostSerializer.new(posts).serializable_hash }, status: :ok
      end

      def show
        render json: { post: ::PostSerializer.new(@post).serializable_hash }, status: :ok
      end

      def create
        post = Post.new(post_params)
        post.user = current_user

        if post.save
          render json: { message: "post #{post.id} was created successfully" }, status: :created
        else
          render json: { message: 'post creation failed' }, status: :bad_request
        end
      end

      def update; end

      def destroy; end

      private

      def set_post
        @post = Post.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:body)
      end
    end
  end
end
