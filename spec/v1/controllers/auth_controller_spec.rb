require 'spec_helper'

RSpec.describe '/api/v1/auth' do
  context 'auth' do
    before do
      get '/api/v1/auth'
    end

    it 'Return Timestamp' do
      expect(last_response.status).to eql 404
    end
  end
end
