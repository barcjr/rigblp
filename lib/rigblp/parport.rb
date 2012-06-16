class Rigblp::Parport
  PPCLAIM=0x0000708b
  PPDATADIR=0x40047090
  PPWDATA=0x40017086
  PPRELEASE=0x0000708c

  def initialize path
    unless File.writable? path
      Rigblp.logger.warn "Parport not accessible!"
      return
    end

    @file = File.open(path, "w")
    @file.sync = true
    @file.ioctl PPCLAIM

    Rigblp.logger.debug("Parport opened")
  end

  def close
    return unless open?
    @file.ioctl PPRELEASE
    @file.close
    @file = nil
    Rigblp.logger.debug("Parport closed")
  end

  def write byte
    return unless open?
    Rigblp.logger.debug("Write parport data: 0x%02X" % byte)
    @file.ioctl(PPDATADIR, [0].pack("i"))
    @file.ioctl(PPWDATA, [byte].pack("C"))
  end

  protected

  def open?
    return true if @file && !@file.closed?
    Rigblp.logger.warn("Parport not open")
    return false
  end
end
