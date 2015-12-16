class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  belongs_to :best_answer, class_name: 'Answer'

  validates :title, presence: true, length: { minimum: 40 }
  validates :description, presence: true, length: { minimum: 150 }
end
