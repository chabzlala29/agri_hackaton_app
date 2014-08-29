class DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_values

  def index
    @questions = Question.all
  end

  def top
    @questions = Question.top
  end

  def newest
    @questions = Question.newest
  end

  def unanswered
    @questions = Question.unanswered
  end

  def search
    @questions = Question.where("question LIKE ?", "%#{params[:query]}%")
    @query = params[:query]
  end

  private
  def set_values
    @tag = Tag.new
    @question = current_user.questions.new
    @tags = Tag.all.map{|t| [t.name, t.id]}
  end


end
