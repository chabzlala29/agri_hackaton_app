class AnswersController < ApplicationController
  def show
    @answer = Answer.find(params[:id])
  end

  def voteup
    @answer = Answer.find(params[:answer_id])
    current_user.likes @answer

    redirect_to question_path(@answer.question.id)
  end

  def votedown
    @answer = Answer.find(params[:answer_id])
    current_user.likes @answer

    redirect_to question_path(@answer.question.id)
  end

  def create
    @answer = current_user.answers.new(answer_params)
    if @answer.save
      redirect_to question_path(@answer.question_id), notice: "Answer Posted!"
    else
      redirect_to @question, notice: "Something is wrong!"
    end
  end

  private
  def answer_params
    params.require(:answer).permit!
  end
end
