class Answer < ActiveRecord::Base
  belongs_to :question, :dependent => :destroy
  belongs_to :user

  validates :question, presence: true
  validates :description, presence: true, length: { minimum: 50 }
end
