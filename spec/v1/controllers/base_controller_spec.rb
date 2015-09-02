require 'spec_helper'

RSpec.describe '/' do
  context 'index' do
    before do
      get '/api/v1'
    end

    it 'Return Timestamp' do
      expect(last_response.body).to include('timestamp')
    end
  end
end
