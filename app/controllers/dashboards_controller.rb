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
    tag_ids = Tag.where("name LIKE ?", "%#{params[:query]}%").collect(&:id)
    puts tag_ids.inspect
    query = ""
    query = tag_ids.map do |tag|
      "'#{tag}' = ANY (tags)"
    end.join(" OR ")
    @questions = Question.where("question LIKE ?", "%#{params[:query]}%")
    Question.where(query).each do |q|
      @questions << q
    end
    @query = params[:query]
  end

  private
  def set_values
    @tag = Tag.new
    @question = current_user.questions.new
    @tags = Tag.all.map{|t| [t.name, t.id]}
  end


end
