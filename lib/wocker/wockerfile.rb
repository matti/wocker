require_relative '../dockerfile_parser'

module Wocker
  class Wockerfile
    def initialize(path)
      @path = path
    end

    def parse
      contents = File.read @path
      parsed = YAML.load contents
      if parsed["ports"]
        ports_split = []
        parsed["ports"].each do |port|
          ports_split << port.split(":")
        end
        parsed.delete "ports"
        parsed["ports"] = ports_split
      end
      parsed
    end
  end
end
