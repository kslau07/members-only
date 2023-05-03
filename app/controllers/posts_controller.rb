class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = current_user
    @post = @current_user.posts.new(post_params)

    if @post.save
      flash[:notice] = 'A new post was created!'
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
