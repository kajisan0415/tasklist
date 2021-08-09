class SeminarsController < ApplicationController
  def index
    @seminars = Seminar.all
    @post_comments = PostComment.all
  end

  def new
    @seminar = Seminar.new
  end

  def create
    @seminar = Seminar.new(seminar_params)
    @seminar.user_id = current_user.id
    if @seminar.save
      redirect_to seminar_path(@seminar), notice: "投稿しました"
    else
      render(:new) && return
    end
  end

  def show
    @seminar = Seminar.find(params[:id])
    @post_comment = PostComment.new
  end


  def edit
    @seminar = Seminar.find(params[:id])
  end

  def update
    @seminar = Seminar.find(params[:id])
    @seminar.user_id = current_user.id
    if @seminar.update(seminar_params)
      redirect_to seminar_path(@seminar), notice: "更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @seminar = Seminar.find(params[:id])
    @seminar.destroy
    redirect_to seminars_path
  end

  private
  def seminar_params
    params.require(:seminar).permit(:title, :starts_at, :ends_at)
  end
end
