##
# Setup global project settings for your apps.
# These settings are inherited by every subapp. You can
# override these settings in the subapps as needed.
#
Padrino.configure_apps do
  # enable :sessions
  set :session_secret, ENV['SESSION_SECRET']
  set :protection, except: [
    :json_csrf, :form_token,
    :http_origin,
    :remote_token
  ]
  set :protect_from_csrf, false
end

# Mounts the core application for this project
Padrino.mount('Logvisual::V1', app_file: Padrino.root('v1/app.rb')
             ).to('/v1'
                 ).host(/^api\.#{ENV['DOMAIN_ROOT']}/)

Padrino.mount('Logvisual::App', app_file: Padrino.root('app/app.rb')
             ).to('/'
                 ).host(ENV['DOMAIN_ROOT'])
