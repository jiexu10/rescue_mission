class AnswersController < ApplicationController

  def index
    @question = Question.find(params[:question_id])
    @answer = Answer.order(created_at: :desc)
  end

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new(answer_params)
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: 'Answer Created Successfully!'
    else
      render "questions/show"
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description, :question_id)
  end
end
