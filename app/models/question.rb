class Question < ApplicationRecord
  # searchkick
  
  has_many :options, dependent: :destroy
  has_many :answers, through: :options
  belongs_to :subject
end
