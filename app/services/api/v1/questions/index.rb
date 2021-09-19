module Api::V1::Questions
  class Index
    prepend SimpleCommand

    def initialize(api_params)
      @query_api = api_params[:q]
    end

    def call
      Oj.load(fetch_questions.to_json(include: { options: {only: [:content, :id]}}))
    end

    private

    def fetch_questions
      question_ids = @query_api.present? ? Question.search(@query_api).map(&:id) : Question.all.pluck(:id)
      option_ids = @query_api.present? ? Option.search(@query_api).map(&:id) : Option.all.pluck(:id)

      query(question_ids, option_ids)
    end

    def query(question_ids, option_ids)
      Question.left_joins(:options).where("questions.id IN (?) OR options.id IN (?)", question_ids, option_ids).uniq
    end
  end
end