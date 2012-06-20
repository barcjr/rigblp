require "thor"

class Rigblp::Command < Thor
  desc "launch", "Launch rig monitoring"
  method_option :radio, type: :string, required: true, desc: "Radio name"
  method_option :netblp, type: :string, required: true, desc: "Netblp book url"
  method_option :rigctl, type: :string, default: `which rigctl`, desc: "rigctl command path"
  method_option :rigopts, type: :string, desc: "rigctl options"
  def launch
    engine = Rigblp::Engine.new
    engine.rigctl = Rigblp::Rigctl.new options[:rigopts], options[:rigctl]
    engine.netblp = Rigblp::Netblp.new options[:netblp], options[:radio]
    engine.run
  end
end
