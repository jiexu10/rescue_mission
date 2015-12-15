class QuestionsController < ApplicationController

  def index
    @questions = Question.order(created_at: :desc)
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answers = @question.answers.order(created_at: :desc)
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

    if @question.update(question_params)
      redirect_to @question, notice: 'Question Edited Successfully!'
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
    params.require(:question).permit(:title, :description)
  end
end
