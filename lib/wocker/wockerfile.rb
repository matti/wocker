require "yaml"

module Wocker
  module Wockerfile
    @@ports = []
    @@runs = []
    @@from = nil
    @@workdir = nil

    def self.ports
      parse
      @@ports
    end
    def self.runs
      parse
      @@runs
    end
    def self.from
      parse
      @@from
    end
    def self.workdir
      parse
      @@workdir
    end

    private
    def self.parse
      contents = File.read "Wockerfile"
      parsed = YAML.load contents
      @@runs = parsed["runs"]
      @@from = parsed["from"]
      @@workdir = parsed["workdir"]

      @@ports = if parsed["ports"]
        ports_split = []
        parsed["ports"].each do |port|
          ports_split << port.split(":")
        end
        ports_split
      end
    end
  end
end
