class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id
    @comment.user_id = current_user.id
    @comment.score = Language.get_data(comment_params[:body]) # API追加分
    if @comment.save
      @comment.post.create_notification_comment!(current_user, @comment.id) # コメント通知
      redirect_to post_path(@post.id), notice: "コメントを投稿しました"
    else
      @post = Post.find(params[:post_id])
      @post_comments = @post.comments.order("created_at DESC")
      @comment_pt_sum = (@post.comments.sum(:score) * 10).round
      render "posts/show"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    comment = @post.comments.find(params[:id])
    comment.destroy
    redirect_to request.referer, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :rate)
  end
end
