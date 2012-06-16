require "rigblp/version"
require "logger"

module Rigblp
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  autoload :Band, "rigblp/band"
  autoload :Rigctl, "rigblp/rigctl"
  autoload :Parport, "rigblp/parport"
end
