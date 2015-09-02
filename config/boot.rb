# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
require 'dotenv'

Bundler.require(:default, RACK_ENV)
Dotenv.load

if Padrino.env == :development
  require 'better_errors'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
  Padrino::Application.use BetterErrors::Middleware
  BetterErrors.application_root = PADRINO_ROOT
  BetterErrors.logger = Padrino.logger
end

Padrino.require_dependencies "#{Padrino.root}/config/initializers/**/*.rb"
##
# Add your before (RE)load hooks here
#
Padrino.before_load do
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!
