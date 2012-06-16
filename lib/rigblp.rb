require "rigblp/version"

module Rigblp
  def self.logger
    @logger ||= Logger.new(STDOUT)
  end

  autoload :Rigctl, "rigblp/rigctl"
end
