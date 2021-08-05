class SeminarsController < ApplicationController
  def index
    @seminars = Seminar.all
  end
  
  def new
    @seminar = Seminar.new
  end
  
  def create
    @seminar = Seminar.new(seminar_params)
    #@article.user_id = current_user.id
    if @seminar.save
      redirect_to seminar_path(@seminar), notice: "投稿しました"
    else
      render(:new) && return
    end
  end
  
  def show
    @seminar = Seminar.find(params[:id])
  end
  
  private seminar_params
    params.require(:seminar).permit(:title, :starts_at, :ends_at)

end
