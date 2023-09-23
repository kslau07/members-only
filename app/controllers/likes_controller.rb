class LikesController < ApplicationController
  def create
    post = Post.find(like_params[:liked_post_id])
    like = post.likes.create(liked_user: current_user)
    flash[:notice] = 'You liked a whispr.' if like.save
    redirect_to posts_path
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to root_path, notice: 'You unliked a whispr.'
  end

  private

  def like_params
    params.require(:like).permit(:liked_post_id)
    # params.permit(:post_id)
  end
end
