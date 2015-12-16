class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order(created_at: :desc)
    if @question.best_answer
      @answers = @answers - [@question.best_answer]
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Question Created Successfully!'
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    notices = []

    if params[:best_answer_id]
      notices << 'Successfully updated best answer'
    end

    notices << 'Question Edited Successfully!'

    if @question.update(question_params)
      redirect_to @question, notice: notices
    else
      render :edit
    end
  end

  def destroy
    @question = Question.destroy(params[:id])
    redirect_to questions_path, notice: "Question #{@question.title} successfully deleted!"
  end

  private
  def question_params
    params.require(:question).permit(:title, :description, :best_answer_id)
  end
end
