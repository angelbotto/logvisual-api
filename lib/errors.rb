##
# BusinessError
#
class BusinessError < StandardError
  attr_reader :message, :ip

  def initialize(message, ip)
    @message = message
    @ip = ip

    Analytics.track(
      user_id: ip,
      event: 'error',
      properties: { message: message })

    { message: message }
  end

  def result
    { message: @message }
  end

  def json
    { message: @message }.to_json
  end
end
