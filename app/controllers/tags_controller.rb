class TagsController < ApplicationController
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    # @tag = current_user.tags.build(tag_params)
    if @tag.save
      redirect_to request.referer notice: "タグを登録しました。"
    else
      @tags = Tag.all
      render "index"
    end
  end

  def edit
    @tag = Tag.find(params[:id])

  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tags_path, notice: "タグを更新しました。"
    else
      render "index"
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path, notice: "タグを削除しました。"
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
