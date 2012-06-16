class Rigblp::Rigctl
  def initialize options, command=nil
    command ||= `which rigctl`.strip
    @command = [command, options].join(" ")
  end

  def frequency
    call("f").to_f
  end

  def frequency= frequency
    call("F #{frequency}")
  end

  def antenna
    call("y").to_i
  end

  def antenna= antenna
    call("Y #{antenna}")
  end

  protected

  def call instruction
    `#{@command} #{instruction}`
  end
end
