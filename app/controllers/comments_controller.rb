class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    # see the comments that the user inputted and is trying to save
    @place = Place.find(params[:place_id])
    @place.comments.create(comment_params.merge(user: current_user))
    redirect_to place_path(@place)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end

end
