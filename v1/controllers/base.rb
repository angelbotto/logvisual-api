Logvisual::V1.controllers :base, map: '/' do
  get :index do
    { timestamp: Time.now.to_i }.to_json
  end
end
