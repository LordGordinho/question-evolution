class Option < ApplicationRecord
  searchkick
  
  belongs_to :question
  has_many :answers
end
