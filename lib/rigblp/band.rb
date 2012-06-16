class Rigblp::Band
  attr_reader :band, :lower, :upper

  def self.all
    @all ||= load_csv
  end

  def self.for_frequency frequency
    all.find{ |band| band.lower <= frequency && band.upper >= frequency }
  end

  protected

  def initialize values
    values.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def band= band
    @band = band.to_sym
  end

  def lower= lower
    @lower = lower.to_f
  end

  def upper= upper
    @upper = upper.to_f
  end

  def self.load_csv
    require "csv"

    Rigblp.logger.debug("Loading bands")

    path = File.expand_path("../../../data/bands.csv", __FILE__)
    options = {headers: true, header_converters: [:symbol]}

    CSV.read(path, options).map{ |row| self.new row }
  end
end
