class Rigblp::Engine
  attr_accessor :rigctl, :netblp

  def initialize
    @latest = Time.now - 3600
    @old_freq= nil
  end

  def step
    raise "No rigctl provided!" unless rigctl
    frequency = rigctl.frequency
    if (@old_freq != frequency) || (@latest < (Time.now - 30))
      @old_freq = frequency
      @latest = Time.now

      band = Rigblp::Band.for_frequency frequency
      Rigblp.logger.info("Frequency: #{frequency}")
      Rigblp.logger.info("Band: #{band ? band.band : "none"}")

      switch_band band if band
      notify_netblp frequency
    end
  end

  def run
    loop { step ; sleep 0.5 }
  end

  def switch_band band

  end

  def notify_netblp frequency
    return unless @netblp
    @netblp.frequency = frequency
  end
end
