class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
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
      redirect_to post_path(@post)
    else
      @post = Post.new
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
      redirect_to post_path(@post), notice: "更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "削除しました。"
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
