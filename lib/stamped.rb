require 'time'
require 'stamped/version'

# Useful extensions for converting time to and from iso8601 in UTC
module Stamped
  def self.included(base)
    base.extend(ClassMethods)
  end

  def stamp
    utc.iso8601
  end

  # Class methods for time
  module ClassMethods
    def from_stamp(timestamp)
      Time.iso8601(timestamp)
    end

    def stamp(time = now)
      time.stamp
    end

    def stamp_time
      from_stamp(stamp)
    end
  end
end

Time.include(Stamped)
