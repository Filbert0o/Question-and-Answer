class QuestionsController < ApplicationController

  def index
    @questions = Question.order(:updated_at)
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end


  def create
    @question = Question.new(question_params)
    # @user = User.find(params[:user_id.to_i])
    # @question.user = @user
    if @question.save
      redirect_to questions_path
      flash[:notice] = "Submitted Question"
    else
      flash.now[:alert] = @question.errors.messages.values
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to question_path(@question)
      flash[:notice] = "Updated Question"
    else
      flash.now[:alert] = @question.errors.messages.values
      render :new
    end


  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy

    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description, :user_id)
  end
end
