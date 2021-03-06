class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.order(:created_at).reverse_order.includes(:user)
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      # render :json => @post 
    else
      render :json => {message: "not saved"}
    end
  end

  def show
    @post = Post.order(:created_at).reverse_order.includes(:comments).find(params[:id])

    if @post.nil?
      render :json => {message: "Cannot find post with id=#{params[:id]}"}
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    if @post.nil?
      render :json => {
        message: "Cannot find post with id=#{params[:id]}"
      }
    else
      if @post.destroy
        render :json => { message: "deleted"}
      else 
        render :json => { message: "not deleted"}
      end
    end
  end

  def update
    @post = Post.find_by_id(params[:id])
     if @post.nil?
      render :json => {
        message: "Cannot find post with id=#{params[:id]}"
      }
    else
      if current_user == @post.user
        if @post.update(post_params)
          render :json => { message: "updated"}
        else 
          render :json => { message: "not updated"}
        end
      end
    end
  end

  def userfeed
    @posts = current_user.posts.reverse_order
    render "index"
  end

  def post_params
    params.require(:post).permit(:title, :caption, :picture, :video)
  end

end