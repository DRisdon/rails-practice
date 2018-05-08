class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      render json: @post
    else
      puts @post.errors.messages.inspect
      render status: :bad_request, json: {
        errors: @post.errors.messages
      }
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    render json: {message: 'post deleted'}
  end

  private

  def post_params
    params.permit(:user, :content)
  end

end
