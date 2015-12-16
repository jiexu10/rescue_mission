class CreateQuestionsBestAnswer < ActiveRecord::Migration
  def change
    add_belongs_to :questions, :best_answer
  end
end
