module Logvisual
  ##
  # V1 Class
  #
  class V1 < Padrino::Application
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    before do
      content_type :json
    end

    error(400) { render 'errors/400' }
    error(403) { render 'errors/403' }
    error(404) { render 'errors/404' }
    error(409) { render 'errors/409' }
    error(500) { render 'errors/500' }
  end
end
