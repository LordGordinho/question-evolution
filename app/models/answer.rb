class Answer < ApplicationRecord
  enum status: [:wrong, :correct]

  belongs_to :option
  belongs_to :question
end
