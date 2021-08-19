class StampsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    stamp = current_user.stamps.new(post_id: post.id)
    stamp.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    stamp = current_user.stamps.find_by(post_id: post.id)
    stamp.destroy
    redirect_to post_path(post)
  end
end
