class QuestionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @question = current_user.questions.new
    @tags = Tag.all.map{|t| [t.name, t.id]}
    @tag = Tag.new
  end

  def create
    question = current_user.questions.new(question_params)
    tags = question_params[:tags].reject! {|t| t.empty? }
    question.tags = tags.join(",")
    if question.save
      redirect_to question, notice: "Question Successfully Saved!"
    else
      redirect_to new_question_path, notice: "Check for missing fields."
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = @question.answers.new
  end

  def voteup
    @question = Question.find(params[:question_id])
    current_user.likes @question

    redirect_to question_path(@question)
  end

  def votedown
    @question = Question.find(params[:question_id])
    current_user.likes @question

    redirect_to root_path, notice: "You've voted successfully!"
  end

  private

  def question_params
    params.require(:question).permit!
  end
end
