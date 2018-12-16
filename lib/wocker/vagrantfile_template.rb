require 'erb'
module Wocker
  class VagrantfileTemplate
    attr_accessor :wocker_from, :wocker_interface, :wocker_ports, :wocker_installs, :wocker_runs

    def render(template)
      ERB.new(template).result(binding)
    end
  end
end
