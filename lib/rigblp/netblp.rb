require "rest-client"

class Rigblp::Netblp
  def initialize url, name
    @url = url
    @name = name
  end

  def frequency= frequency
    url = "#{@url}/radios/#{URI.escape @name}"
    Rigblp.logger.info("PUT #{url}")
    RestClient.put url, frequency: frequency
  end
end
