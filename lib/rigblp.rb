require "rigblp/version"
require "logger"

module Rigblp
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  autoload :Rigctl, "rigblp/rigctl"
  autoload :Parport, "rigblp/parport"
end
