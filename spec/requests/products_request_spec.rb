require 'rails_helper'

RSpec.describe 'Products', type: :request do
  describe 'GET /item' do
    it 'returns http success' do
      get '/products/item'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /search' do
    it 'returns http success' do
      get '/products/search'
      expect(response).to have_http_status(:success)
    end
  end
end
