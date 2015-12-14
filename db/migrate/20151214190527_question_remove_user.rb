class QuestionRemoveUser < ActiveRecord::Migration
  def change
    remove_belongs_to :questions, :user
  end
end
