Logvisual::V1.controllers :task do
  task_params = [:content]

  before do
    halt 403 unless request.env['HTTP_AUTHORIZATION']
    @user = User.validate_token(request.env['HTTP_AUTHORIZATION'])
    halt 403 unless @user
  end

  before :create do
    halt 400 unless task_params.all? { |e| params.key?(e.to_s) }
  end

  post :create do
    @task = Task.create(content: params[:content], user: @user)
    render :task
  end

  post :list do
    @tasks = Task.where(user: @user).limit(10)
    render :tasks
  end
end
