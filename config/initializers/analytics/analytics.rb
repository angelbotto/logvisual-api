require 'segment/analytics'

Analytics = Segment::Analytics.new(
  write_key: ENV['WRITEKEY'],
  on_error: proc { |_status, msg| print msg })
