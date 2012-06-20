require "rigblp/version"
require "logger"

module Rigblp
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end
end

require "rigblp/band"
require "rigblp/command"
require "rigblp/engine"
require "rigblp/rigctl"
require "rigblp/netblp"
require "rigblp/parport"
