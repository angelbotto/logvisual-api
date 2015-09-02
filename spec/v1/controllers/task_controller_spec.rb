require 'spec_helper'

RSpec.describe '/api/v1/task' do
  context 'task' do
    before do
      get '/api/v1/task'
    end

    it 'Return Timestamp' do
      expect(last_response.status).to eql 404
    end
  end
end
