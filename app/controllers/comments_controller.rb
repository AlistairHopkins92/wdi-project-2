class CommentsController < ApplicationController

before_action :set_comment, only: [:accept, :reject, :cancel]

  def new
    @journey = Journey.find(params[:journey_id])
    @comment = Comment.new
  end

  def create
      @journey = Journey.find(params[:journey_id])
      @comment = @journey.comments.new(comment_params)
      @comment.sender_id = current_user.id
      @comment.receiver_id = @journey.user.id
      
      if @comment.save
          flash[:success] = "Your comment was made successfully"
          redirect_to journeys_path
      else
          flash[:danger] = "Your comment was not sent"
          redirect_to journeys_path
      end
  end

  def inbox
    @comment  = Comment.all

  end

  def outbox
    @comment  = Comment.all
    @sender   = User.find(@comment.first.sender_id)
    @receiver = User.find(@comment.first.receiver_id)
  end

  def accept
      @comment.accept!
      flash[:success] = "You accepted an user request!"
      @journey = @comment.journey
      @journey.decrement!(:free_seats, 1)
      redirect_to :back
  end

  def reject
      @comment.reject!
     flash[:danger] = "You rejected an user request!"
     redirect_to :back
  end

  def cancel
      @comment.cancel!
      flash[:info] = "You cancelled an user request!"
      redirect_to :back
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:notes, :agreed_setoff_time, :service_id)
    end

end
