require 'bundler/setup'
require 'padrino-core/cli/rake'
if Padrino.env == :test
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

PadrinoTasks.use(:database)
PadrinoTasks.use(:mongoid)
PadrinoTasks.init
