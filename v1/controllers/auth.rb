Logvisual::V1.controllers :auth do
  sessions_params = [:email, :password]

  ##
  # Before for validate params based in sessions?params
  #
  before do
    halt 400 unless sessions_params.all? { |e| params.key?(e.to_s) }
  end

  post :signin, params: sessions_params do
    @user = User.signin(params)
    @user ? (render :user) : (halt 409)
  end

  post :signup, params: sessions_params do
    @user = User.signup(params)
    @user ? (render :user) : (halt 409)
  end
end
