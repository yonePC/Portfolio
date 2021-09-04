class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.comments.order("created_at DESC")
    @comment = Comment.new
    @comment_pt_sum = (@post.comments.sum(:score) * 10).round
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    tag_list = params[:post][:tag_ids].split(",")
    @post.user_id = current_user.id
    if @post.save
      @post.save_tags(tag_list)
      redirect_to post_path(@post), notice: "投稿しました"
    else
      render "new"
    end
  end

  def edit
    @tag_list = @post.tags.pluck(:name).join(",")
  end

  def update
    tag_list = params[:post][:tag_ids].split(",")
    if @post.update(post_params)
      @post.update_tags(tag_list)
      redirect_to post_path(@post), notice: "投稿を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:area, :body)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
  end
end
