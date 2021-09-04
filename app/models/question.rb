class Question < ApplicationRecord
  searchkick
  
  has_many :options
  has_many :answers, through: :options
  belongs_to :subject
end
