class Api::V1::QuestionsController < ApplicationController
  def index
    question_ids = params_api[:q].present? ? Question.search(params_api[:q]).map(&:id) : Question.all
    options_ids = params_api[:q].present? ? Option.search(params_api[:q]).map(&:id) : Option.all
    
    service = Oj.load(questions.to_json(include: { options: {only: [:name, :id]}}))
    render json: {questions: service}, code: :ok
  end

  private 

  def params_api
    params.permit(:q)
  end
end
