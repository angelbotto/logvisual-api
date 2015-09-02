# Connection.new takes host and port.

host = 'localhost'
port = 27_017

database_name = case Padrino.env
                when :development then 'logvisual_development'
                when :production  then 'logvisual_production'
                when :test        then 'logvisual_test'
end

# Use MONGO_URI if it's set as an environmental variable.
Mongoid::Config.sessions =
  if ENV['MONGO_URI']
    { default: { uri: ENV['MONGO_URI'] } }
  else
    { default: { hosts: ["#{host}:#{port}"], database: database_name } }
  end

Mongoid.raise_not_found_error = false
