class PostCommentsController < ApplicationController
  def create
    seminar = Seminar.find(params[:seminar_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.seminar_id = seminar.id
    comment.save
    redirect_to seminar_path(seminar)
  end

  def destroy
    PostComment.find_by(id: params[:id], seminar_id: params[:seminar_id]).destroy
    redirect_to seminar_path(params[:seminar_id])
  end
  
    private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :report)
  end
end
