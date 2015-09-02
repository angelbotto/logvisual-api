module Logvisual
  ##
  # App Class
  #
  class App < Padrino::Application
    register SassInitializer
    register Padrino::Mailer
    register Padrino::Helpers

    enable :sessions

    get :index do
      'logvisual.co'
    end

    error(404) { render 'errors/404' }
    error(500) { render 'errors/500' }
  end
end
