class Api::V1::QuestionsController < ApplicationController
  def index
    service = Api::V1::Questions::Index.call(api_params)

    render json: { questions: service.result }, code: :ok
  end

  private 

  def api_params
    params.permit(:q)
  end
end
