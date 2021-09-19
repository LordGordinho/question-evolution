require 'rails_helper'

RSpec.describe Api::V1::OptionsController, type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:token) {  JsonWebToken.encode(user_id: user.id) }

  before do
    host! 'localhost:3000/api/v1'
  end

  describe 'GET #index' do
    before do
      get '/options', headers: { "Authorization" => "Bearer #{token}" }
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end