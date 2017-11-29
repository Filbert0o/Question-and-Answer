class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answers = @question.answers
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question
    @answers = @question.answers
    if @answer.save
      redirect_to question_path(@question)
      flash[:notice] = "Submitted Answer"
    else
      flash.now[:alert] = @answer.errors.messages.values
      render :'questions/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:description, :user_id)
  end
end
